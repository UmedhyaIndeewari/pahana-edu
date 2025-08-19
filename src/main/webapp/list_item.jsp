<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.ItemDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item List - Pahana Edu Bookshop</title>
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
        }
        .btn-edit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
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
        .stock-badge {
            font-size: 0.875rem;
            padding: 0.5rem 0.75rem;
        }
        .price-badge {
            font-size: 0.875rem;
            padding: 0.5rem 0.75rem;
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
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
                <i class="fas fa-box me-3"></i>
                Item Management
            </h1>
            <p class="lead mb-0">View and manage inventory items</p>
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
                                Item List
                            </h4>
                            <a href="items?action=new" class="btn btn-primary">
                                <i class="fas fa-plus me-2"></i>Add New Item
                            </a>
                        </div>

                        <!-- Item Table -->
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-hashtag me-2"></i>Item ID</th>
                                        <th><i class="fas fa-tag me-2"></i>Name</th>
                                        <th><i class="fas fa-folder me-2"></i>Category</th>
                                        <th><i class="fas fa-boxes me-2"></i>Stock Quantity</th>
                                        <th><i class="fas fa-dollar-sign me-2"></i>Price Per Unit</th>
                                        <th><i class="fas fa-cogs me-2"></i>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
                                        if (items != null && !items.isEmpty()) {
                                            for (ItemDTO item : items) {
                                    %>
                                    <tr>
                                        <td>
                                            <span class="fw-bold text-primary"><%= item.getId() %></span>
                                        </td>
                                        <td><%= item.getName() %></td>
                                        <td>
                                            <span class="badge bg-secondary"><%= item.getCategory() %></span>
                                        </td>
                                        <td>
                                            <span class="badge bg-info stock-badge"><%= item.getStockQuantity() %></span>
                                        </td>
                                        <td>
                                            <span class="badge price-badge text-white">$<%= item.getPricePerUnit() %></span>
                                        </td>
                                        <td>
                                            <a href="items?action=edit&id=<%= item.getId() %>" 
                                               class="btn btn-action btn-edit">
                                                <i class="fas fa-edit me-1"></i>Edit
                                            </a>
                                            <form action="items" method="post" style="display:inline;" 
                                                  onsubmit="return confirm('Are you sure you want to delete this item?');">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="id" value="<%= item.getId() %>">
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
                                                <i class="fas fa-box"></i>
                                                <h5>No items found</h5>
                                                <p class="text-muted">Start by adding your first inventory item</p>
                                                <a href="items?action=new" class="btn btn-primary">
                                                    <i class="fas fa-plus me-2"></i>Add Item
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

