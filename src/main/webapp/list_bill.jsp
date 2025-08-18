<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.BillDTO" %>
<%@ page import="com.icbt.dto.BillItemDTO" %>
<%@ page import="com.icbt.dto.ItemDTO" %>
<%@ page import="com.icbt.dto.CustomerDTO" %>
<%@ page import="com.icbt.model.Item" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill List - Pahana Edu Bookshop</title>
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
        .content-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
        }
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }
        .table {
            margin-bottom: 0;
        }
        .table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            font-weight: 600;
            padding: 1rem;
        }
        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-color: #f8f9fa;
        }
        .table tbody tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease;
        }
        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin: 0.25rem;
            font-size: 0.875rem;
        }
        .btn-edit {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            border: none;


        }
        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .btn-delete {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
            border: none;
        }
        .btn-delete:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .btn-items {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
        }
        .btn-items:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .btn-print {
            background: linear-gradient(135deg, #059669 0%, #10b981 100%);
            color: white;
            border: none;
        }
        .btn-print:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            color: white;
        }
        .btn-back {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
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
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }
        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
        .amount-badge {
            font-size: 0.875rem;
            padding: 0.5rem 0.75rem;
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }
        .items-preview {
            max-width: 200px;
            font-size: 0.875rem;
        }
        .customer-name {
            font-weight: 600;
            color: #667eea;
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
                <i class="fas fa-file-invoice-dollar me-3"></i>
                Bill Management
            </h1>
            <p class="lead mb-0">View and manage all customer bills</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="content-card">
                    <div class="card-body p-4">
                        <!-- Header Actions -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="mb-0">
                                <i class="fas fa-list me-2"></i>
                                Bill List
                            </h4>
                            <a href="bills?action=new" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>Create New Bill
                            </a>
                        </div>

                        <!-- Bill Table -->
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-hashtag me-2"></i>Bill ID</th>
                                        <th><i class="fas fa-user me-2"></i>Customer</th>
                                        <th><i class="fas fa-dollar-sign me-2"></i>Total Amount</th>
                                        <th><i class="fas fa-calendar me-2"></i>Billing Date</th>
                                        <th><i class="fas fa-boxes me-2"></i>Items & Quantities</th>
                                        <th><i class="fas fa-cogs me-2"></i>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<BillDTO> bills = (List<BillDTO>) request.getAttribute("bills");
                                        if (bills != null && !bills.isEmpty()) {
                                            for (BillDTO bill : bills) {
                                    %>
                                    <tr>
                                        <td>
                                            <span class="fw-bold text-primary">#<%= bill.getId() %></span>
                                        </td>
                                        <td>
      <%
                                            List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");
                                                for (CustomerDTO customer : customers){
                                                    if(customer.getId() == bill.getCustomerId()){
                                                %>
                                                    <span class="customer-name"><%= customer.getName() != null ? customer.getName() : "N/A" %></span>
<%
                                            }
    }
                                            %>
                                        </td>
                                        <td>
                                            <span class="badge amount-badge text-white">$<%= String.format("%.2f", bill.getTotalAmount()) %></span>
                                        </td>
                                        <td><%= bill.getBillingDate() != null ? bill.getBillingDate() : "N/A" %></td>
                                        <td>
                                            <div class="items-preview">
                                                <%
                                                    List<BillItemDTO> billItems = bill.getItems();
                                                    if (billItems != null && !billItems.isEmpty()) {
                                                        for (int i = 0; i < Math.min(billItems.size(), 3); i++) {
                                                            BillItemDTO item = billItems.get(i);
                                                %>
                                                <div class="small text-muted">
                                                    <%
                                                        List<ItemDTO> itemDTOS = (List<ItemDTO>) request.getAttribute("items");
                                                        for (ItemDTO it : itemDTOS){
                                                        if  (it.getId() == item.getItemId()){
                                                    %>
                                                    <%= it.getName() != null ? it.getName() : "Unknown Item" %>
                                                    (Qty: <%= item.getQuantity() %>)
                                                    <%
                                                        }
                                                        }
                                                    %>
                                                </div>
                                                <%
                                                        }
                                                        if (billItems.size() > 3) {
                                                %>
                                                <div class="small text-muted">+<%= billItems.size() - 3 %> more items</div>
                                                <%
                                                        }
                                                    } else {
                                                %>
                                                <span class="text-muted">No items</span>
                                                <%
                                                    }
                                                %>
                                            </div>
                                        </td>
                                        <td>
                                            <a href="bills?action=edit&id=<%= bill.getId() %>" 
                                               class="btn btn-action btn-edit">
                                                <i class="fas fa-edit me-1"></i>Edit
                                            </a>
<%--                                            <a href="bills?action=items&id=<%= bill.getId() %>" --%>
<%--                                               class="btn btn-action btn-items">--%>
<%--                                                <i class="fas fa-list me-1"></i>Items--%>
<%--                                            </a>--%>
                                            <a href="bills?action=print&id=<%= bill.getId() %>" 
                                               class="btn btn-action btn-print">
                                                <i class="fas fa-print me-1"></i>Print
                                            </a>
                                            <form action="bills" method="post" style="display:inline;" 
                                                  onsubmit="return confirm('Are you sure you want to delete this bill?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="<%= bill.getId() %>">
                                                <button type="submit" class="btn btn-action btn-delete">
                                                    <i class="fas fa-trash me-1"></i>Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        } else {
                                    %>
                                    <tr>
                                        <td colspan="6">
                                            <div class="empty-state">
                                                <i class="fas fa-file-invoice"></i>
                                                <h5>No bills found</h5>
                                                <p class="text-muted">Start by creating your first bill</p>
                                                <a href="bills?action=new" class="btn btn-primary">
                                                    <i class="fas fa-plus me-2"></i>Create Bill
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>

                        <!-- Footer Actions -->
                        <div class="d-flex justify-content-center mt-4">
                            <a href="dashboard" class="btn btn-back">
                                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
