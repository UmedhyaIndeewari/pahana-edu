<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support - Pahana Edu Bookshop</title>
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
        .help-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
        }
        .help-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        .help-icon {
            font-size: 2rem;
            color: #667eea;
            margin-bottom: 1rem;
        }
        .faq-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1rem;
            border-radius: 10px 10px 0 0;
            margin: -1rem -1rem 1rem -1rem;
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
        .contact-section {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            color: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            margin-top: 2rem;
        }
        .contact-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.8;
        }
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
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
            <h1 class="display-4 fw-bold mb-3">
                <i class="fas fa-question-circle me-3"></i>
                Help & Support
            </h1>
            <p class="lead mb-0">Find answers to common questions and get support</p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <!-- Quick Start Guide -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="help-card">
                    <div class="card-body p-4">
                        <div class="faq-header">
                            <h4 class="mb-0">
                                <i class="fas fa-rocket me-2"></i>
                                Quick Start Guide
                            </h4>
                        </div>
                        <div class="feature-grid">
                            <div class="text-center">
                                <div class="help-icon">
                                    <i class="fas fa-users"></i>
                                </div>
                                <h5>1. Add Customers</h5>
                                <p class="text-muted">Start by adding your customer base</p>
                            </div>
                            <div class="text-center">
                                <div class="help-icon">
                                    <i class="fas fa-box"></i>
                                </div>
                                <h5>2. Manage Inventory</h5>
                                <p class="text-muted">Add items and track stock levels</p>
                            </div>
                            <div class="text-center">
                                <div class="help-icon">
                                    <i class="fas fa-file-invoice-dollar"></i>
                                </div>
                                <h5>3. Create Bills</h5>
                                <p class="text-muted">Generate bills for customer purchases</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- FAQ Section -->
        <div class="row">
            <div class="col-12">
                <div class="help-card">
                    <div class="card-body p-4">
                        <div class="faq-header">
                            <h4 class="mb-0">
                                <i class="fas fa-lightbulb me-2"></i>
                                Frequently Asked Questions
                            </h4>
                        </div>
                        
                        <div class="accordion" id="helpAccordion">
                            <!-- FAQ Item 1 -->
                            <div class="accordion-item border-0 mb-3">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button collapsed bg-light" type="button" 
                                            data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                        <i class="fas fa-user-plus me-3 text-primary"></i>
                                        How do I register a new customer?
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse" 
                                     data-bs-parent="#helpAccordion">
                                    <div class="accordion-body">
                                        Navigate to the <strong>Customers</strong> section and click <strong>"Add Customer"</strong>. 
                                        Fill in the required fields such as name, address, contact number, and save.
                                    </div>
                                </div>
                            </div>

                            <!-- FAQ Item 2 -->
                            <div class="accordion-item border-0 mb-3">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class="accordion-button collapsed bg-light" type="button" 
                                            data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                        <i class="fas fa-box-open me-3 text-success"></i>
                                        How can I add new items to the system?
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse" 
                                     data-bs-parent="#helpAccordion">
                                    <div class="accordion-body">
                                        Go to the <strong>Items</strong> section, click on <strong>"Add Item"</strong>, and enter 
                                        item name, category, stock quantity, and price. Click <strong>"Submit"</strong> to save it in the database.
                                    </div>
                                </div>
                            </div>

                            <!-- FAQ Item 3 -->
                            <div class="accordion-item border-0 mb-3">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed bg-light" type="button" 
                                            data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                        <i class="fas fa-file-invoice me-3 text-info"></i>
                                        How do I create a new bill?
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" 
                                     data-bs-parent="#helpAccordion">
                                    <div class="accordion-body">
                                        Visit the <strong>Bills</strong> section and click on <strong>"Add Bill"</strong>. 
                                        Select a customer, choose items from the dropdown, adjust quantities, and click <strong>"Submit"</strong>.
                                    </div>
                                </div>
                            </div>

                            <!-- FAQ Item 4 -->
                            <div class="accordion-item border-0 mb-3">
                                <h2 class="accordion-header" id="headingFour">
                                    <button class="accordion-button collapsed bg-light" type="button" 
                                            data-bs-toggle="collapse" data-bs-target="#collapseFour">
                                        <i class="fas fa-edit me-3 text-warning"></i>
                                        Can I update a bill after it's created?
                                    </button>
                                </h2>
                                <div id="collapseFour" class="accordion-collapse collapse" 
                                     data-bs-parent="#helpAccordion">
                                    <div class="accordion-body">
                                        Yes, go to the <strong>Bills</strong> list and click on <strong>"Edit"</strong> next to the bill you want to modify. 
                                        You can change item quantities or remove/add items.
                                    </div>
                                </div>
                            </div>

                            <!-- FAQ Item 5 -->
                            <div class="accordion-item border-0 mb-3">
                                <h2 class="accordion-header" id="headingFive">
                                    <button class="accordion-button collapsed bg-light" type="button" 
                                            data-bs-toggle="collapse" data-bs-target="#collapseFive">
                                        <i class="fas fa-trash me-3 text-danger"></i>
                                        How do I delete a customer or item?
                                    </button>
                                </h2>
                                <div id="collapseFive" class="accordion-collapse collapse" 
                                     data-bs-parent="#helpAccordion">
                                    <div class="accordion-body">
                                        From the respective section (<strong>Customers</strong> or <strong>Items</strong>), 
                                        click on <strong>"Delete"</strong> next to the record. Be cautious as this action is irreversible.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="row">
            <div class="col-12">
                <div class="contact-section">
                    <div class="contact-icon">
                        <i class="fas fa-headset"></i>
                    </div>
                    <h4>Need Further Assistance?</h4>
                    <p class="mb-3">Contact your system administrator or refer to the user manual provided with the software documentation.</p>
                    <a href="dashboard" class="btn btn-light btn-lg">
                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
