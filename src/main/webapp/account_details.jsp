<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.dto.CustomerDTO" %>

<%
    CustomerDTO customer = (CustomerDTO) request.getAttribute("customer");
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Details - Pahana Edu Bookshop</title>
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
        .search-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
        }
        .form-control {
            border-radius: 10px;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        .btn-search {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-search:hover {
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
        .result-card {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            border-radius: 15px;
            border: 2px solid #dee2e6;
            padding: 1.5rem;
            margin-top: 1.5rem;
        }
        .customer-info {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            margin-top: 1rem;
        }
        .info-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #f1f3f4;
        }
        .info-item:last-child {
            border-bottom: none;
        }
        .info-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        .info-content {
            flex: 1;
        }
        .info-label {
            font-weight: 600;
            color: #6c757d;
            font-size: 0.875rem;
            margin-bottom: 0.25rem;
        }
        .info-value {
            color: #495057;
            font-size: 1rem;
        }
        .search-icon {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 1.5rem;
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
                <i class="fas fa-search me-3"></i>
                Account Details
            </h1>
            <p class="lead mb-0">Search and view customer account information</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="search-card">
                    <div class="card-body p-4">
                        <!-- Search Section -->
                        <div class="text-center mb-4">
                            <div class="search-icon">
                                <i class="fas fa-search"></i>
                            </div>
                            <h4 class="mb-3">Search Customer by Account Number</h4>
                            <p class="text-muted">Enter the account number to find customer details</p>
                        </div>

                        <form action="customers" method="get">
                            <div class="row justify-content-center">
                                <div class="col-md-8">
                                    <div class="mb-4">
                                        <label for="account_number" class="form-label">
                                            <i class="fas fa-hashtag me-2"></i>Account Number
                                        </label>
                                        <input type="text" class="form-control form-control-lg" 
                                               name="account_number" id="account_number" required 
                                               placeholder="Enter account number">
                                        <input type="hidden" name="action" value="searched"/>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-search btn-lg">
                                    <i class="fas fa-search me-2"></i>Search Customer
                                </button>
                            </div>
                        </form>

                        <!-- Results Section -->
                        <% if (message != null) { %>
                        <div class="result-card">
                            <div class="text-center">
                                <i class="fas fa-info-circle text-info me-2" style="font-size: 1.5rem;"></i>
                                <h5 class="mb-2">Search Result</h5>
                                <p class="mb-0 text-muted"><%= message %></p>
                            </div>
                        </div>
                        <% } else if (customer != null) { %>
                        <div class="result-card">
                            <div class="text-center mb-3">
                                <i class="fas fa-user-check text-success me-2" style="font-size: 1.5rem;"></i>
                                <h5 class="mb-0">Customer Found!</h5>
                            </div>
                            
                            <div class="customer-info">
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-hashtag"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Account Number</div>
                                        <div class="info-value fw-bold text-primary"><%= customer.getAccountNumber() %></div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Full Name</div>
                                        <div class="info-value"><%= customer.getName() %></div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Address</div>
                                        <div class="info-value"><%= customer.getAddress() %></div>
                                    </div>
                                </div>
                                
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-phone"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Telephone</div>
                                        <div class="info-value"><%= customer.getTelephone() %></div>
                                    </div>
                                </div>
                                
                                <% if (customer.getUnitsConsumed() != 0) { %>
                                <div class="info-item">
                                    <div class="info-icon">
                                        <i class="fas fa-bolt"></i>
                                    </div>
                                    <div class="info-content">
                                        <div class="info-label">Units Consumed</div>
                                        <div class="info-value">
                                            <span class="badge bg-info fs-6"><%= customer.getUnitsConsumed() %></span>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <% } %>

                        <!-- Footer Actions -->
                        <div class="d-flex justify-content-center mt-4">
                            <a href="dashboard" class="btn btn-secondary btn-back">
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

