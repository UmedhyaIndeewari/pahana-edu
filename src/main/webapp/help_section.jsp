<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Help Section</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 30px;
      background-color: #f9f9f9;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    .faq-container {
      max-width: 900px;
      margin: auto;
    }

    .faq {
      background-color: #fff;
      border-radius: 10px;
      margin-bottom: 15px;
      padding: 20px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .faq h4 {
      margin-top: 0;
      color: #2c3e50;
    }

    .faq p {
      margin: 10px 0 0;
      color: #555;
    }

    .back-btn {
      display: block;
      margin: 30px auto 0;
      padding: 10px 20px;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      border-radius: 5px;
      text-align: center;
      width: fit-content;
    }

    .back-btn:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>

<h2>📘 Help & Support</h2>

<div class="faq-container">

  <div class="faq">
    <h4>👤 How do I register a new customer?</h4>
    <p>Navigate to the Customers section and click "Add Customer". Fill in the required fields such as name, address, contact number, and save.</p>
  </div>

  <div class="faq">
    <h4>📦 How can I add new items to the system?</h4>
    <p>Go to the Items section, click on "Add Item", and enter item name, category, and price. Click "Submit" to save it in the database.</p>
  </div>

  <div class="faq">
    <h4>🧾 How do I create a new bill?</h4>
    <p>Visit the Bills section and click on "Add Bill". Select a customer, choose items from the dropdown, adjust quantities, and click "Submit".</p>
  </div>

  <div class="faq">
    <h4>🔁 Can I update a bill after it's created?</h4>
    <p>Yes, go to the Bills list and click on "Edit" next to the bill you want to modify. You can change item quantities or remove/add items.</p>
  </div>

  <div class="faq">
    <h4>🗑 How do I delete a customer or item?</h4>
    <p>From the respective section (Customers or Items), click on "Delete" next to the record. Be cautious as this action is irreversible.</p>
  </div>

  <div class="faq">
    <h4>💡 Need further assistance?</h4>
    <p>Contact your system administrator or refer to the user manual provided with the software documentation.</p>
  </div>

</div>

<a href="dashboard" class="back-btn">← Back to Dashboard</a>



</body>
</html>
