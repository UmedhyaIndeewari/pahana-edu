<%@ page import="com.icbt.dto.BillDTO, com.icbt.dto.CustomerDTO, com.icbt.dto.BillItemDTO, com.icbt.dto.ItemDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  BillDTO bill = (BillDTO) request.getAttribute("bill");
  CustomerDTO customer = (CustomerDTO) request.getAttribute("customer");
  List<BillItemDTO> billItems = (List<BillItemDTO>) request.getAttribute("billItems");
  List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Summary - #<%= bill.getId() %> - Pahana Edu Bookshop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        @media print {
            .no-print {
                display: none !important;
            }
            body {
                margin: 0;
                padding: 20px;
                background: white !important;
            }
            .bill-card {
                box-shadow: none !important;
                border: 2px solid #000 !important;
            }
            .page-header {
                background: #667eea !important;
                -webkit-print-color-adjust: exact;
                color-adjust: exact;
            }
        }

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
        .bill-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            border: none;
            overflow: hidden;
        }
        .bill-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .company-name {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        .company-tagline {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        .bill-info-section {
            padding: 2rem;
            border-bottom: 2px solid #e9ecef;
        }
        .bill-details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 1.5rem;
        }
        .bill-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 0.5rem;
        }
        .bill-date {
            font-size: 1rem;
            color: #6c757d;
        }
        .section-title {
            color: #667eea;
            margin-bottom: 1rem;
            font-size: 1.25rem;
            font-weight: 600;
        }
        .customer-details p, .bill-details p {
            margin: 0.5rem 0;
            color: #495057;
        }
        .items-section {
            padding: 2rem;
            border-bottom: 2px solid #e9ecef;
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
        .total-section {
            padding: 2rem;
            background: #f8f9fa;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem 0;
            border-bottom: 1px solid #dee2e6;
        }
        .total-row:last-child {
            border-bottom: none;
            font-weight: 700;
            font-size: 1.25rem;
            color: #667eea;
        }
        .btn-print {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            border-radius: 10px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .btn-print:hover {
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
        .info-card {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 1.5rem;
            border-left: 4px solid #667eea;
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
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark no-print">
        <div class="container">
            <a class="navbar-brand" href="dashboard">
                <i class="fas fa-book-open me-2"></i>
                Pahana Edu Bookshop
            </a>
            <div class="navbar-nav ms-auto">
                <a class="btn btn-outline-light btn-sm me-2" href="dashboard">
                    <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                </a>
                <button class="btn btn-success btn-sm" onclick="window.print()">
                    <i class="fas fa-print me-2"></i>Print Bill
                </button>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <div class="page-header no-print">
        <div class="container text-center">
            <h1 class="display-5 fw-bold mb-3">
                <i class="fas fa-file-invoice-dollar me-3"></i>
                Bill Summary
            </h1>
            <p class="lead mb-0">Bill #<%= bill.getId() %> - <%= customer != null ? customer.getName() : "Customer" %></p>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="bill-card">
                    <!-- Bill Header -->
                    <div class="bill-header">
                        <div class="company-name">
                            <i class="fas fa-book-open me-3"></i>
                            Pahana Edu Bookshop
                        </div>
                        <div class="company-tagline">Your trusted educational partner</div>
                    </div>

                    <!-- Bill Information -->
                    <div class="bill-info-section">
                        <div class="bill-details-grid">
                            <div>
                                <div class="bill-number">Bill #<%= bill.getId() %></div>
                                <div class="bill-date">
                                    <i class="fas fa-calendar me-2"></i>
                                    <%= bill.getBillingDate() != null ? bill.getBillingDate() : "Date not set" %>
                                </div>
                            </div>
                            <div class="info-card">
                                <div class="info-label">Customer Information</div>
                                <div class="info-value">
                                    <strong><%= customer != null ? customer.getName() : "N/A" %></strong><br>
                                    <small class="text-muted">
                                        <%= customer != null ? customer.getAddress() : "Address not available" %>
                                    </small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Items Section -->
                    <div class="items-section">
                        <h5 class="section-title">
                            <i class="fas fa-boxes me-2"></i>
                            Bill Items
                        </h5>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><i class="fas fa-hashtag me-2"></i>Item</th>
                                        <th><i class="fas fa-tag me-2"></i>Category</th>
                                        <th><i class="fas fa-cubes me-2"></i>Quantity</th>
                                        <th><i class="fas fa-dollar-sign me-2"></i>Unit Price</th>
                                        <th><i class="fas fa-calculator me-2"></i>Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        if (billItems != null && !billItems.isEmpty()) {
                                            for (BillItemDTO billItem : billItems) {
                                                ItemDTO item = null;
                                                for (ItemDTO i : items) {
                                                    if (i.getId() == billItem.getItemId()) {
                                                        item = i;
                                                        break;
                                                    }
                                                }
                                                if (item != null) {
                                    %>
                                    <tr>
                                        <td>
                                            <strong><%= item.getName() %></strong>
                                        </td>
                                        <td>
                                            <span class="badge bg-secondary"><%= item.getCategory() %></span>
                                        </td>
                                        <td><%= billItem.getQuantity() %></td>
                                        <td>$<%= String.format("%.2f", item.getPricePerUnit()) %></td>
                                        <td>
                                            <strong>$<%= String.format("%.2f", billItem.getQuantity() * item.getPricePerUnit()) %></strong>
                                        </td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        } else {
                                    %>
                                    <tr>
                                        <td colspan="5" class="text-center text-muted">
                                            <i class="fas fa-box me-2"></i>No items found
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Total Section -->
                    <div class="total-section">
                        <div class="total-row">
                            <span>Subtotal:</span>
                            <span>$<%= String.format("%.2f", bill.getTotalAmount()) %></span>
                        </div>
                        <div class="total-row">
                            <span>Tax (0%):</span>
                            <span>$0.00</span>
                        </div>
                        <div class="total-row">
                            <span>Total Amount:</span>
                            <span>$<%= String.format("%.2f", bill.getTotalAmount()) %></span>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="d-flex justify-content-center gap-3 mt-4 no-print">
                    <a href="dashboard" class="btn btn-secondary btn-back">
                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                    </a>
                    <button class="btn btn-success btn-print" onclick="window.print()">
                        <i class="fas fa-print me-2"></i>Print Bill
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
