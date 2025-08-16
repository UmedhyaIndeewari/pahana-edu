<%@ page import="com.icbt.dto.BillDTO, com.icbt.dto.CustomerDTO, com.icbt.dto.BillItemDTO, com.icbt.dto.ItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BillDTO bill = (BillDTO) request.getAttribute("bill");
  CustomerDTO customer = (CustomerDTO) request.getAttribute("customer");
  List<BillItemDTO> billItems = (List<BillItemDTO>) request.getAttribute("billItems");
  List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
%>
<html>
<head>
  <title>Bill Summary - #<%= bill.getId() %></title>
  <style>
    @media print {
      .no-print {
        display: none !important;
      }
      body {
        margin: 0;
        padding: 20px;
      }
      .bill-container {
        box-shadow: none !important;
        border: 1px solid #000 !important;
      }
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
      margin: 0;
      padding: 20px;
    }

    .bill-container {
      max-width: 800px;
      margin: 0 auto;
      background-color: white;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    .bill-header {
      background: linear-gradient(135deg, #100571 0%, #1e3a8a 100%);
      color: white;
      padding: 30px;
      text-align: center;
    }

    .company-name {
      font-size: 28px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .company-tagline {
      font-size: 16px;
      opacity: 0.9;
    }

    .bill-info {
      padding: 30px;
      border-bottom: 2px solid #e5e7eb;
    }

    .bill-details {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 30px;
      margin-bottom: 20px;
    }

    .bill-number {
      font-size: 24px;
      font-weight: bold;
      color: #100571;
      margin-bottom: 10px;
    }

    .bill-date {
      font-size: 16px;
      color: #6b7280;
    }

    .customer-info h3, .bill-info h3 {
      color: #100571;
      margin-bottom: 15px;
      font-size: 18px;
    }

    .customer-details p, .bill-details p {
      margin: 8px 0;
      color: #374151;
    }

    .items-table {
      padding: 30px;
      border-bottom: 2px solid #e5e7eb;
    }

    .items-table h3 {
      color: #100571;
      margin-bottom: 20px;
      font-size: 18px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 15px;
    }

    th {
      background-color: #f3f4f6;
      color: #374151;
      font-weight: 600;
      padding: 15px 12px;
      text-align: left;
      border-bottom: 2px solid #e5e7eb;
    }

    td {
      padding: 15px 12px;
      border-bottom: 1px solid #e5e7eb;
      color: #374151;
    }

    .text-right {
      text-align: right;
    }

    .text-center {
      text-align: center;
    }

    .total-section {
      padding: 30px;
      background-color: #f9fafb;
    }

    .total-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px 0;
      font-size: 16px;
    }

    .grand-total {
      font-size: 24px;
      font-weight: bold;
      color: #100571;
      border-top: 2px solid #e5e7eb;
      padding-top: 15px;
      margin-top: 15px;
    }

    .actions {
      padding: 30px;
      text-align: center;
      background-color: #f9fafb;
    }

    .btn {
      display: inline-block;
      padding: 12px 24px;
      margin: 0 10px;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      font-weight: 500;
      text-decoration: none;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn-primary {
      background-color: #100571;
      color: white;
    }

    .btn-primary:hover {
      background-color: #0f0444;
      transform: translateY(-2px);
    }

    .btn-secondary {
      background-color: #6b7280;
      color: white;
    }

    .btn-secondary:hover {
      background-color: #4b5563;
      transform: translateY(-2px);
    }

    .print-btn {
      background-color: #059669;
      color: white;
    }

    .print-btn:hover {
      background-color: #047857;
      transform: translateY(-2px);
    }

    .footer {
      padding: 20px 30px;
      text-align: center;
      color: #6b7280;
      font-size: 14px;
      border-top: 1px solid #e5e7eb;
    }
  </style>
</head>
<body>
  <div class="bill-container">
    <!-- Bill Header -->
    <div class="bill-header">
      <div class="company-name">PAHANA EDU</div>
      <div class="company-tagline">Educational Services & Solutions</div>
    </div>

    <!-- Bill Information -->
    <div class="bill-info">
      <div class="bill-details">
        <div>
          <div class="bill-number">Bill #<%= bill.getId() %></div>
          <div class="bill-date">Date: <%= bill.getBillingDate() %></div>
        </div>
        <div class="customer-info">
          <h3>Customer Information</h3>
          <div class="customer-details">
            <p><strong>Name:</strong> <%= customer.getName() %></p>
            <p><strong>Account:</strong> #<%= customer.getAccountNumber() %></p>
            <p><strong>Address:</strong> <%= customer.getAddress() %></p>
            <p><strong>Phone:</strong> <%= customer.getTelephone() %></p>
          </div>
        </div>
      </div>
    </div>

    <!-- Items Table -->
    <div class="items-table">
      <h3>Items</h3>
      <table>
        <thead>
          <tr>
            <th>Item</th>
            <th>Category</th>
            <th class="text-center">Quantity</th>
            <th class="text-right">Unit Price (Rs.)</th>
            <th class="text-right">Total (Rs.)</th>
          </tr>
        </thead>
        <tbody>
          <% for (int i = 0; i < billItems.size(); i++) { %>
            <tr>
              <td><%= items.get(i).getName() %></td>
              <td><%= items.get(i).getCategory() %></td>
              <td class="text-center"><%= billItems.get(i).getQuantity() %></td>
              <td class="text-right"><%= String.format("%.2f", items.get(i).getPricePerUnit()) %></td>
              <td class="text-right"><%= String.format("%.2f", billItems.get(i).getTotalAmount()) %></td>
            </tr>
          <% } %>
        </tbody>
      </table>
    </div>

    <!-- Total Section -->
    <div class="total-section">
      <div class="total-row grand-total">
        <span>Grand Total:</span>
        <span>Rs. <%= String.format("%.2f", bill.getTotalAmount()) %></span>
      </div>
    </div>

    <!-- Actions -->
    <div class="actions no-print">
      <button class="btn print-btn" onclick="window.print()">🖨️ Print Bill</button>
      <a href="bills" class="btn btn-secondary">← Back to Bills</a>
      <a href="dashboard" class="btn btn-primary">🏠 Dashboard</a>
    </div>

    <!-- Footer -->
    <div class="footer">
      <p>Thank you for choosing PAHANA EDU!</p>
      <p>For any queries, please contact our support team.</p>
    </div>
  </div>

  <script>
    // Auto-focus on print button for better UX
    document.addEventListener('DOMContentLoaded', function() {
      // Add any additional JavaScript functionality here
      console.log('Bill summary page loaded successfully');
    });
  </script>
</body>
</html>
