<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Pahana Edu Bookshop</title>
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
                <i class="fas fa-user-plus me-3"></i>
                Add New Customer
            </h1>
            <p class="lead mb-0">Create a new customer account</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="form-card">
                    <div class="card-body p-4">
                        <form action="customers?action=add" method="post">
                            <!-- Basic Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-info-circle"></i>
                                    Basic Information
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="account_number" class="form-label">
                                            <i class="fas fa-hashtag me-2"></i>Account Number
                                        </label>
                                        <input type="text" class="form-control" id="account_number" 
                                               name="account_number" required 
                                               placeholder="Enter account number">
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="name" class="form-label">
                                            <i class="fas fa-user me-2"></i>Full Name
                                        </label>
                                        <input type="text" class="form-control" id="name" 
                                               name="name" required 
                                               placeholder="Enter customer name">
                                    </div>
                                </div>
                            </div>

                            <!-- Contact Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-address-book"></i>
                                    Contact Information
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="address" class="form-label">
                                            <i class="fas fa-map-marker-alt me-2"></i>Address
                                        </label>
                                        <textarea class="form-control" id="address" name="address" 
                                                  rows="3" placeholder="Enter customer address"></textarea>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="telephone" class="form-label">
                                            <i class="fas fa-phone me-2"></i>Telephone
                                        </label>
                                        <input type="tel" class="form-control" id="telephone" 
                                               name="telephone" 
                                               placeholder="Enter phone number">
                                    </div>
                                </div>
                            </div>

                            <!-- Usage Information Section -->
                            <div class="form-section">
                                <h5 class="section-title">
                                    <i class="fas fa-bolt"></i>
                                    Usage Information
                                </h5>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="units_consumed" class="form-label">
                                            <i class="fas fa-tachometer-alt me-2"></i>Units Consumed
                                        </label>
                                        <input type="number" class="form-control" id="units_consumed" 
                                               name="units_consumed" min="0" step="0.01" 
                                               placeholder="Enter units consumed">
                                    </div>
                                </div>
                            </div>

                            <!-- Form Actions -->
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="dashboard" class="btn btn-secondary btn-back">
                                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                                </a>
                                <button type="submit" class="btn btn-primary btn-submit">
                                    <i class="fas fa-save me-2"></i>Add Customer
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
</body>
</html>


