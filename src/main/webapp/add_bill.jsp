<%@ page import="com.icbt.dto.CustomerDTO, com.icbt.dto.ItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");
  List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Bill - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }
        .page-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .form-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
        }
        .form-control, .form-select {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .btn-back {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .form-section {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }
        .section-title {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }
        .section-title i {
            margin-right: 0.5rem;
        }
        .table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: 600;
        }
        .table td {
            vertical-align: middle;
            border-color: #f8f9fa;
        }
        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            margin: 0.25rem;
            font-size: 0.875rem;
        }
        .btn-add {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-add:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .btn-remove {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
        }
        .btn-remove:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .qty-input {
            text-align: center;
            width: 70px;
            border-radius: 8px;
        }
        .total-section {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 1rem;
        }
        .total-amount {
            font-size: 1.5rem;
            font-weight: 700;
        }
        .alert {
            border-radius: 10px;
            border: none;
        }
        .empty-state {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
        }
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="dashboard">
                <i class="fas fa-book-open me-2"></i>
                Pahana Edu Bookshop
            </a>
            <div class="navbar-nav ms-auto">
                <a class="btn btn-outline-light btn-sm" href="dashboard">
                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                </a>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <div class="page-header">
        <div class="container text-center">
            <h1 class="display-5 fw-bold mb-3">
                <i class="fas fa-plus-circle me-3"></i>
                Create New Bill
            </h1>
            <p class="lead mb-0">Generate a new bill for customer purchases</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="form-card">
                    <div class="card-body p-4">
                        <form action="bills?action=add" method="post">
                            <!-- Bill Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-info-circle"></i>
                                    Bill Information
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="customer_id" class="form-label">
                                            <i class="fas fa-user me-2"></i>Customer
                                        </label>
                                        <select class="form-select" id="customer_id" name="customer_id" required>
                                            <option value="">Select Customer</option>
                                            <%
                                                if (customers != null) {
                                                    for (CustomerDTO customer : customers) {
                                            %>
                                            <option value="<%= customer.getId() %>">
                                                <%= customer.getName() %> (<%= customer.getAccountNumber() %>)
                                            </option>
                                            <%
                                                    }
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="billing_date" class="form-label">
                                            <i class="fas fa-calendar me-2"></i>Billing Date
                                        </label>
                                        <input type="date" class="form-control" id="billing_date" 
                                               name="billing_date" required>
                                    </div>
                                </div>
                            </div>

                            <!-- Items Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-boxes"></i>
                                    Bill Items
                                </h5>
                                
                                <%
                                    if (items != null && !items.isEmpty()) {
                                %>
                                <div class="table-responsive">
                                    <table class="table table-hover" id="itemsTable">
                                        <thead>
                                            <tr>
                                                <th><i class="fas fa-tag me-2"></i>Item</th>
                                                <th><i class="fas fa-cubes me-2"></i>Quantity</th>
                                                <th><i class="fas fa-dollar-sign me-2"></i>Unit Price</th>
                                                <th><i class="fas fa-calculator me-2"></i>Total</th>
                                                <th><i class="fas fa-cogs me-2"></i>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="itemsTableBody">
                                            <!-- Items will be added here dynamically -->
                                        </tbody>
                                    </table>
                                </div>

                                <div class="text-center mt-3">
                                    <button type="button" class="btn btn-action btn-add" onclick="addItem()">
                                        <i class="fas fa-plus me-2"></i>Add Item
                                    </button>
                                </div>
                                <%
                                    } else {
                                %>
                                <div class="empty-state">
                                    <i class="fas fa-box"></i>
                                    <h5>No items available</h5>
                                    <p class="text-muted">Please add some items to your inventory first</p>
                                    <a href="items?action=new" class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>Add Item
                                    </a>
                                </div>
                                <%
                                    }
                                %>
                            </div>

                            <!-- Total Section -->
                            <div class="total-section text-center">
                                <h5 class="mb-2">Total Amount</h5>
                                <div class="total-amount" id="totalAmount">$0.00</div>
                            </div>

                            <!-- Form Actions -->
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <a href="dashboard" class="btn btn-secondary btn-back">
                                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                                </a>
                                <%
                                    if (items != null && !items.isEmpty()) {
                                %>
                                <button type="submit" class="btn btn-primary btn-submit">
                                    <i class="fas fa-save me-2"></i>Create Bill
                                </button>
                                <%
                                    }
                                %>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const items = <%
            if (items != null) {
                out.print("[");
                for (int i = 0; i < items.size(); i++) {
                    ItemDTO item = items.get(i);
                    if (i > 0) out.print(",");
                    out.print("{\"id\":" + item.getId() + ",\"name\":\"" + item.getName() + "\",\"price\":" + item.getPricePerUnit() + "}");
                }
                out.print("]");
            } else {
                out.print("[]");
            }
        %>;

        function addItem() {
            const tbody = document.getElementById('itemsTableBody');
            const newRow = document.createElement('tr');
            
            let optionsHtml = '<option value="">Select Item</option>';
            items.forEach(item => {
                optionsHtml += `<option value="${item.id}" data-price="${item.price}">${item.name} - $${item.price.toFixed(2)}</option>`;
            });
            
            newRow.innerHTML = `
                <td>
                    <select class="form-select" name="item_ids[]" required onchange="updateTotal()">
                        ${optionsHtml}
                    </select>
                </td>
                <td>
                    <input type="number" class="form-control qty-input" name="quantities[]" 
                           value="1" min="1" required onchange="updateTotal()">
                </td>
                <td class="unit-price">$0.00</td>
                <td class="item-total">$0.00</td>
                <td>
                    <button type="button" class="btn btn-action btn-remove" onclick="removeItem(this)">
                        <i class="fas fa-trash"></i>
                    </button>
                </td>
            `;
            
            tbody.appendChild(newRow);
            updateTotal();
        }

        function removeItem(button) {
            button.closest('tr').remove();
            updateTotal();
        }

        function updateTotal() {
            let total = 0;
            const rows = document.querySelectorAll('#itemsTableBody tr');
            
            rows.forEach(row => {
                const itemSelect = row.querySelector('select[name="item_ids[]"]');
                const quantityInput = row.querySelector('input[name="quantities[]"]');
                const unitPriceCell = row.querySelector('.unit-price');
                const itemTotalCell = row.querySelector('.item-total');
                
                if (itemSelect.value && quantityInput.value) {
                    const selectedOption = itemSelect.options[itemSelect.selectedIndex];
                    const unitPrice = parseFloat(selectedOption.dataset.price);
                    const quantity = parseInt(quantityInput.value);
                    const itemTotal = quantity * unitPrice;
                    
                    unitPriceCell.textContent = `$${unitPrice.toFixed(2)}`;
                    itemTotalCell.textContent = `$${itemTotal.toFixed(2)}`;
                    total += itemTotal;
                }
            });
            
            document.getElementById('totalAmount').textContent = `$${total.toFixed(2)}`;
        }

        // Add initial item row when page loads
        document.addEventListener('DOMContentLoaded', function() {
            if (items.length > 0) {
                addItem();
            }
        });
    </script>
</body>
</html>
