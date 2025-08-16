<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.icbt.dto.BillDTO" %>
<%@ page import="com.icbt.dto.BillItemDTO" %>
<%@ page import="com.icbt.dto.ItemDTO" %>

<%@ page import="com.icbt.dto.CustomerDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>List Bills</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 40px;
        }

        .table-container {
            max-width: 1000px;
            margin: auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #100571;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .actions a {
            margin: 0 5px;
            padding: 6px 12px;
            text-decoration: none;
            color: #fff;
            border-radius: 4px;
            font-size: 14px;
        }

        .edit-btn { background-color: #28a745; }
        .delete-btn { background-color: #dc3545; }
        .items-btn { background-color: #100571; }

        .print-btn { background-color: #059669; }


        .top-actions {
            margin-bottom: 20px;
            text-align: right;
        }

        .top-actions a {
            background-color: #007bff;
            color: #fff;
            padding: 10px 14px;
            text-decoration: none;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="table-container">
    <div class="top-actions">
        <a href="bills?action=new">Create New Bill</a>


    </div>
    <h2>All Bills</h2>
    <div class="top-actions">
        <a href="dashboard">BACK</a>
    </div>


    <table>
        <thead>
        <tr>
            <th>Bill ID</th>
            <th>Customer ID</th>
            <th>Total Amount</th>
            <th>Billing Date</th>
            <th>Items & Quantities</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<BillDTO> bills = (List<BillDTO>) request.getAttribute("bills");
            List<ItemDTO> items = (List<ItemDTO>) request.getAttribute("items");

            List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");

            if (bills != null && !bills.isEmpty()) {
                for (BillDTO bill : bills) {
        %>
        <tr>
            <td><%= bill.getId() %></td>
            <% for (CustomerDTO customer : customers){
                if (bill.getCustomerId() == customer.getId()){
              %>
            <td><%= customer.getName() %></td>
            <%
                }
            }
            %>

            <td><%= bill.getTotalAmount() %></td>
            <td><%= bill.getBillingDate() %></td>
            <td>
                <%
                    StringBuilder itemsText = new StringBuilder();
                    ItemDTO item = new ItemDTO();
                    List<BillItemDTO> billItems = bill.getItems();
                    if (billItems != null && !billItems.isEmpty()) {
                        for (int i = 0; i < billItems.size(); i++) {
                            BillItemDTO bi = billItems.get(i);

                            for (ItemDTO it : items) {
                                if (it.getId() == bi.getItemId()) {
                                   item = it;
                                    break;

                                }
                            }
                            if (item != null) {
                                itemsText.append(item.getName())
                                        .append(" (")
                                        .append(bi.getQuantity())
                                        .append(")");
                                if (i < billItems.size() - 1) {
                                    itemsText.append(", ");
                                }
                            }
                        }
                    } else {
                        itemsText.append("No items");
                    }
                %>
                <%= itemsText.toString() %>
            </td>
            <td class="actions" style="display: flex; flex-direction: row" >
                <a class="edit-btn" href="bills?action=edit&id=<%= bill.getId() %>">Edit</a>
                <a class="delete-btn" href="bills?action=delete&id=<%= bill.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this bill?');">Delete</a>
                <a class="items-btn" href="bills?action=summary&id=<%= bill.getId() %>">View Summary</a>
                <button class="print-btn" onclick="printBill(<%= bill.getId() %>)" style="border: none; color: white; padding: 6px 12px; border-radius: 4px; font-size: 14px; cursor: pointer;">Print</button>

            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No bills found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<script>
    function printBill(billId) {
        // Open bill summary in new window for printing
        const printWindow = window.open('bills?action=summary&id=' + billId, '_blank');
        printWindow.onload = function() {
            printWindow.print();
        };
    }

</body>
</html>
