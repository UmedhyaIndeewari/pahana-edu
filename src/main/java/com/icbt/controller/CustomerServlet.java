package com.icbt.controller;

import com.icbt.dto.CustomerDTO;
import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieving form data
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int unitsConsumed = Integer.parseInt(request.getParameter("unitsConsumed"));

        // Creating a DTO object
        Customer customer = new Customer(id, accountNumber, name, phone, address,unitsConsumed);

        // Saving the customer
        boolean isSaved = customerService.addCustomer(customer);

        if (isSaved) {
            request.setAttribute("message", "Customer added successfully.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-success.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "Failed to add customer.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("customer-form.jsp");
            dispatcher.forward(request, response);
        }
    }
}

