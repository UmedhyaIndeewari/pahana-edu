package com.icbt.controller;

import com.icbt.dto.BillDTO;
import com.icbt.model.Bill;
import com.icbt.service.BillService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/bills")
public class BillServlet extends HttpServlet {
    private BillService billService;

    @Override
    public void init() {
        billService = new BillService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String action = request.getParameter("action");

        if (action == null) {
            if (idParam == null) {
                List<BillDTO> billList = billService.getAllBills();
                request.setAttribute("bills", billList);
                request.getRequestDispatcher("list_bills.jsp").forward(request, response);
            } else {
                int id = Integer.parseInt(idParam);
                BillDTO bill = billService.getBill(id);
                request.setAttribute("bill", bill);
                request.getRequestDispatcher("edit_bill.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("add_bill.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            int id = 0;
            String idString = request.getParameter("id");
            if (idString != null && !idString.isEmpty()) {
                id = Integer.parseInt(idString);
            }

            boolean result = false;

            switch (action) {
                case "add":
                    int customerId = Integer.parseInt(request.getParameter("customer_id"));
                    Double totalAmount = Double.parseDouble(request.getParameter("total_amount"));
                    Bill newBill = new Bill(id, customerId, totalAmount, null);
                    result = billService.addBill(newBill);
                    if (result) {
                        response.sendRedirect("bills");
                    } else {
                        request.setAttribute("error", "Failed to add bill.");
                        request.getRequestDispatcher("add_bill.jsp").forward(request, response);
                    }
                    break;

                case "edit":
                    int customerIdEdit = Integer.parseInt(request.getParameter("customer_id"));
                    double totalEdit = Double.parseDouble(request.getParameter("total_amount"));
                    Bill billToUpdate = new Bill(id, customerIdEdit, totalEdit, null);
                    result = billService.updateBill(billToUpdate);
                    if (result) {
                        response.sendRedirect("bills");
                    } else {
                        request.setAttribute("error", "Failed to update bill.");
                        request.getRequestDispatcher("edit_bill.jsp").forward(request, response);
                    }
                    break;

                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    result = billService.deleteBill(deleteId);
                    if (result) {
                        response.sendRedirect("bills");
                    } else {
                        request.setAttribute("error", "Failed to delete bill.");
                        response.sendRedirect("bills");
                    }
                    break;

                default:
                    request.setAttribute("error", "Unknown action.");
                    request.getRequestDispatcher("list_bills.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

