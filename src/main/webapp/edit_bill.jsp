<%@ page import="com.icbt.dto.CustomerDTO, com.icbt.dto.ItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.BillItemDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");
  List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
  List<BillItemDTO> billItems = (List<BillItemDTO>) request.getAttribute("billItems");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Bill</title>
  <style>
    /* Use same styles from Add Bill */
    body {
      font-family: 'Segoe UI', sans-serif;
      padding: 30px;
      background-color: #f9f9f9;
    }

    h2 {
      margin-bottom: 20px;
      color: #333;
    }

    form {
      background-color: #fff;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    label {
      font-weight: bold;
      display: block;
      margin-bottom: 8px;
    }

    select, input[type="number"], input[type="date"] {
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
      width: 100%;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 12px;
      text-align: center;
    }

    th {
      background-color: #f0f0f0;
    }

    .qty-input {
      text-align: center;
      width: 60px;
    }

    .btn {
      padding: 6px 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn-add {
      background-color: #100571;
      color: white;
      margin-top: 10px;
    }

    .btn-remove {
      background-color: #dc3545;
      color: white;
    }

    .btn-qty {
      background-color: #007bff;
      color: white;
      width: 30px;
    }

    .total-row {
      font-weight: bold;
      margin-top: 10px;
    }

    button[type="submit"] {
      background-color: #28a745;
      color: white;
      padding: 10px 20px;
      margin-top: 20px;
      border: none;
      border-radius: 5px;
      font-size: 16px;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .top-actions {
      margin-bottom: 20px;
    }

    .top-actions a {
      text-decoration: none;
      background: #555;
      color: white;
      padding: 8px 15px;
      border-radius: 6px;
    }
  </style>
</head>
<body>

<div class="top-actions">
  <a href="dashboard">BACK</a>
</div>

<h2>Edit Bill</h2>

<form method="post" action="bills">
  <input type="hidden" name="action" value="edit"/>
  <input type="hidden" name="id" value="<%= request.getAttribute("id") %>"/>

  <div class="form-group">
    <label for="customer_id">Customer</label>
    <select name="customer_id" id="customer_id" required>
      <option value="">-- Select Customer --</option>
      <% for (CustomerDTO customer : customers) { %>
      <option value="<%= customer.getId() %>" <%= customer.getId() == (int)request.getAttribute("customer_id") ? "selected" : "" %>>
        <%= customer.getName() %>
      </option>
      <% } %>
    </select>
  </div>

  <label for="billing_date">Billing Date</label>
  <input type="date" id="billing_date" name="billing_date"
         value="<%= request.getAttribute("billing_date") != null ? request.getAttribute("billing_date") : "" %>"
         required>

  <table id="itemsTable">
    <thead>
    <tr>
      <th>Item</th>
      <th>Quantity</th>
      <th>Total Price (Rs.)</th>
      <th>Remove</th>
    </tr>
    </thead>
    <tbody>
    <% if (billItems != null) {
      for (BillItemDTO billItem : billItems) {
        int selectedItemId = billItem.getItemId();
        int qty = billItem.getQuantity();
        double price = billItem.getTotalAmount();

    %>
    <tr>
      <td>
        <select name="itemIds[]" class="item-select" onchange="updatePrice(this)">
          <option value="">-- Select Item --</option>
          <% for (ItemDTO item : items) { %>
          <option value="<%= item.getId() %>" data-price="<%= item.getPricePerUnit() %>"
                  <%= item.getId() == selectedItemId ? "selected" : "" %>>
            <%= item.getName() %> - Rs. <%= item.getPricePerUnit() %>
          </option>
          <% } %>
        </select>
      </td>
      <td>
        <button type="button" class="btn btn-qty" onclick="changeQty(this, -1)">-</button>
        <input type="number" name="quantities[]" class="qty-input" value="<%= qty %>" min="1" onchange="updateRow(this)"/>
        <button type="button" class="btn btn-qty" onclick="changeQty(this, 1)">+</button>
      </td>
      <td class="row-total"><%= price%></td>

      <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">🗑</button></td>
    </tr>
    <% }} %>
    </tbody>
  </table>

  <button type="button" class="btn btn-add" onclick="addRow()">+ Add Item</button>

  <p class="total-row"><strong>Total Amount:</strong> Rs. <span id="grandTotal"><%= request.getAttribute("total_amount")%></span></p>
  <input type="hidden" name="total_amount" id="total_amount" value="<%= request.getAttribute("total_amount")%>"/>

  <button type="submit">Update Bill</button>
</form>

<script>
  function updatePrice(selectElem) {
    const row = selectElem.closest('tr');
    const qty = parseInt(row.querySelector('.qty-input').value) || 0;
    const price = parseFloat(selectElem.selectedOptions[0].dataset.price || 0);
    const totalCell = row.querySelector('.row-total');
    totalCell.innerText = (qty * price).toFixed(2);
    updateGrandTotal();
  }

  function changeQty(btn, delta) {
    const row = btn.closest('tr');
    const input = row.querySelector('.qty-input');
    let value = parseInt(input.value) || 1;
    value = Math.max(1, value + delta);
    input.value = value;
    updateRow(input);
  }

  function updateRow(inputElem) {
    const row = inputElem.closest('tr');
    const select = row.querySelector('.item-select');
    updatePrice(select);
  }

  function updateGrandTotal() {
    let total = 0;
    document.querySelectorAll('.row-total').forEach(cell => {
      total += parseFloat(cell.innerText) || 0;
    });
    document.getElementById('grandTotal').innerText = total.toFixed(2);
    document.getElementById('total_amount').value = total.toFixed(2);
  }

  function addRow() {
    const tableBody = document.querySelector('#itemsTable tbody');
    const newRow = document.createElement('tr');

    newRow.innerHTML = `
      <td>
        <select name="itemIds[]" class="item-select" onchange="updatePrice(this)">
          <option value="">-- Select Item --</option>
          <% for (ItemDTO item : items) { %>
            <option value="<%= item.getId() %>" data-price="<%= item.getPricePerUnit() %>">
              <%= item.getName() %> - Rs. <%= item.getPricePerUnit() %>
            </option>
          <% } %>
        </select>
      </td>
      <td>
        <button type="button" class="btn btn-qty" onclick="changeQty(this, -1)">-</button>
        <input type="number" name="quantities[]" class="qty-input" value="1" min="1" onchange="updateRow(this)"/>
        <button type="button" class="btn btn-qty" onclick="changeQty(this, 1)">+</button>
      </td>
      <td class="row-total">0.00</td>
      <td><button type="button" class="btn btn-remove" onclick="removeRow(this)">🗑</button></td>
    `;

    tableBody.appendChild(newRow);
  }

  function removeRow(btn) {
    const row = btn.closest('tr');
    row.remove();
    updateGrandTotal();
  }

  updateGrandTotal();
</script>

</body>
</html>
