<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item - Pahana Edu Bookshop</title>
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
        .alert {
            border-radius: 10px;
            border: none;
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
        .category-suggestions {
            background: #e9ecef;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 0.5rem;
        }
        .category-suggestion {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            margin: 0.25rem;
            font-size: 0.875rem;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        .category-suggestion:hover {
            background: #5a6fd8;
            transform: scale(1.05);
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
                Add New Item
            </h1>
            <p class="lead mb-0">Add a new item to your inventory</p>
        </div>
    </div>


    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-card">
                    <div class="card-body p-4">
                        <form action="items?action=add" method="post">
                            <!-- Basic Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-info-circle"></i>
                                    Item Information
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">
                                            <i class="fas fa-tag me-2"></i>Item Name
                                        </label>
                                        <input type="text" class="form-control" id="name" 
                                               name="name" required 
                                               placeholder="Enter item name">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="category" class="form-label">
                                            <i class="fas fa-folder me-2"></i>Category
                                        </label>
                                        <input type="text" class="form-control" id="category" 
                                               name="category" required 
                                               placeholder="Enter category">
                                        <div class="category-suggestions">
                                            <small class="text-muted d-block mb-2">Common categories:</small>
                                            <span class="category-suggestion" onclick="setCategory('Books')">Books</span>
                                            <span class="category-suggestion" onclick="setCategory('Stationery')">Stationery</span>
                                            <span class="category-suggestion" onclick="setCategory('Electronics')">Electronics</span>
                                            <span class="category-suggestion" onclick="setCategory('Art Supplies')">Art Supplies</span>
                                            <span class="category-suggestion" onclick="setCategory('Office')">Office</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Inventory Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-boxes"></i>
                                    Inventory Details
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="stockQuantity" class="form-label">
                                            <i class="fas fa-cubes me-2"></i>Stock Quantity
                                        </label>
                                        <input type="number" class="form-control" id="stockQuantity" 
                                               name="stock_quantity" required min="0" 
                                               placeholder="Enter stock quantity">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="pricePerUnit" class="form-label">
                                            <i class="fas fa-dollar-sign me-2"></i>Price Per Unit
                                        </label>
                                        <div class="input-group">
                                            <span class="input-group-text">$</span>
                                            <input type="number" class="form-control" id="pricePerUnit" 
                                                   name="price_per_unit" required min="0" step="0.01" 
                                                   placeholder="0.00">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Form Actions -->
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="dashboard" class="btn btn-secondary btn-back">
                                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                                </a>
                                <button type="submit" class="btn btn-primary btn-submit">
                                    <i class="fas fa-save me-2"></i>Add Item
                                </button>
                            </div>
                        </form>

                        <!-- Messages -->
                        <%
                            String message = (String) request.getAttribute("message");
                            String error = (String) request.getAttribute("error");
                            if (message != null) {
                        %>
                        <div class="alert alert-success mt-4" role="alert">
                            <i class="fas fa-check-circle me-2"></i><%= message %>
                        </div>
                        <% } else if (error != null) { %>
                        <div class="alert alert-danger mt-4" role="alert">
                            <i class="fas fa-exclamation-triangle me-2"></i><%= error %>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function setCategory(category) {
            document.getElementById('category').value = category;
        }
    </script>
</body>
</html>
