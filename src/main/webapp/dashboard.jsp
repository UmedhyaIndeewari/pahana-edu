<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.icbt.dto.UserDTO" %>
<%
    UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;

    if (user == null) {
        // Redirect to login if no user is found
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Pahana Edu Bookshop</title>
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
        .welcome-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
        }
        .dashboard-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            height: 100%;
            border: none;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #667eea;
        }
        .btn-dashboard {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-dashboard:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .logout-btn {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
        }
        .logout-btn:hover {
            background: linear-gradient(135deg, #ff5252 0%, #d63031 100%);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-book-open me-2"></i>
                Pahana Edu Bookshop
            </a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <i class="fas fa-user me-2"></i>
                    Welcome, <%= user.getUsername() %>
                </span>
                <a class="btn btn-outline-light btn-sm" href="logout">
                    <i class="fas fa-sign-out-alt me-2"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <!-- Welcome Section -->
    <div class="welcome-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-3">
                <i class="fas fa-tachometer-alt me-3"></i>
                Dashboard
            </h1>
            <p class="lead mb-0">Welcome back! Manage your bookshop operations efficiently.</p>
        </div>
    </div>

    <!-- Dashboard Content -->
    <div class="container">
        <div class="row g-4">
            <!-- Customer Management -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h5 class="card-title mb-3">Customer Management</h5>
                        <p class="card-text text-muted mb-4">Add, edit, and manage customer accounts</p>
                        <div class="d-grid gap-2">
                            <a href="customers?action=new" class="btn btn-dashboard">
                                <i class="fas fa-plus me-2"></i>Add Customer
                            </a>
                            <a href="customers" class="btn btn-dashboard">
                                <i class="fas fa-list me-2"></i>List Customers
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item Management -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-box"></i>
                        </div>
                        <h5 class="card-title mb-3">Item Management</h5>
                        <p class="card-text text-muted mb-4">Manage inventory and product catalog</p>
                        <div class="d-grid gap-2">
                            <a href="items?action=new" class="btn btn-dashboard">
                                <i class="fas fa-plus me-2"></i>Add Item
                            </a>
                            <a href="items" class="btn btn-dashboard">
                                <i class="fas fa-list me-2"></i>List Items
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Billing Management -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-file-invoice-dollar"></i>
                        </div>
                        <h5 class="card-title mb-3">Billing Management</h5>
                        <p class="card-text text-muted mb-4">Create and manage customer bills</p>
                        <div class="d-grid gap-2">
                            <a href="bills?action=new" class="btn btn-dashboard">
                                <i class="fas fa-plus me-2"></i>Add Bill
                            </a>
                            <a href="bills" class="btn btn-dashboard">
                                <i class="fas fa-list me-2"></i>List Bills
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Account Details -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h5 class="card-title mb-3">Account Details</h5>
                        <p class="card-text text-muted mb-4">Search and view customer account details</p>
                        <div class="d-grid">
                            <a href="customers?action=search" class="btn btn-dashboard">
                                <i class="fas fa-search me-2"></i>Search Accounts
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Help Section -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-question-circle"></i>
                        </div>
                        <h5 class="card-title mb-3">Help & Support</h5>
                        <p class="card-text text-muted mb-4">Get help and documentation</p>
                        <div class="d-grid">
                            <a href="help" class="btn btn-dashboard">
                                <i class="fas fa-question me-2"></i>Help Section
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="col-md-6 col-lg-4">
                <div class="card dashboard-card h-100">
                    <div class="card-body text-center p-4">
                        <div class="card-icon">
                            <i class="fas fa-rocket"></i>
                        </div>
                        <h5 class="card-title mb-3">Quick Actions</h5>
                        <p class="card-text text-muted mb-4">Common tasks and shortcuts</p>
                        <div class="d-grid gap-2">
                            <a href="customers?action=new" class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-user-plus me-2"></i>New Customer
                            </a>
                            <a href="bills?action=new" class="btn btn-outline-success btn-sm">
                                <i class="fas fa-plus me-2"></i>New Bill
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
