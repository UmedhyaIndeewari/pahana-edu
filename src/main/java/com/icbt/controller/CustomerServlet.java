package com.icbt.controller;

import com.icbt.dto.CustomerDTO;
import com.icbt.model.Customer;
import com.icbt.service.CustomerService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService;

    @Override
    public void init() {
        customerService = new CustomerService();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse resp)
            throws ServletException, IOException {
        String accountNumberString = request.getParameter("account_number");
        String action = request.getParameter("action");
        if (action == null) {


            if (accountNumberString == null) {

                List<CustomerDTO> customerList = customerService.getAllCustomers();
                request.setAttribute("customers", customerList);

                request.getRequestDispatcher("/list_customer.jsp").forward(request, resp);
            } else {
                int accountNumber = Integer.parseInt(accountNumberString);
                CustomerDTO customerDTO = customerService.getCustomer(accountNumber);
                request.setAttribute("id", customerDTO.getId());
                request.setAttribute("account_number", accountNumber);
                request.setAttribute("name", customerDTO.getName());
                request.setAttribute("address", customerDTO.getAddress());
                request.setAttribute("telephone", customerDTO.getTelephone());
                request.setAttribute("units_consumed", customerDTO.getUnitsConsumed());
                request.getRequestDispatcher("edit_customer.jsp").forward(request, resp);
            }

        }
        else if(action.equals("search")){
            request.getRequestDispatcher("account_details.jsp").forward(request, resp);
        }
        else if(action.equals("searched")){
            CustomerDTO customerDTO = customerService.getCustomer(Integer.parseInt(accountNumberString));
            request.setAttribute("customer", customerDTO);
            request.getRequestDispatcher("account_details.jsp").forward(request, resp);
        }
        else{


            RequestDispatcher dispatcher = request.getRequestDispatcher("add_customer.jsp");
            dispatcher.forward(request, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            int id = 0;
            String idString = request.getParameter("id");
            if(idString != null){
                id = Integer.parseInt(idString);
            }
            int accountNumber = Integer.parseInt(request.getParameter("account_number"));

            boolean result = false;
            Customer customer;
            CustomerDTO customerDTO;

            switch (action) {
                case "add":
                    String name = request.getParameter("name");
                    String phone = request.getParameter("telephone");
                    String address = request.getParameter("address");
                    int unitsConsumed = Integer.parseInt(request.getParameter("units_consumed"));
                    customer = new Customer(id, accountNumber, name, address, phone, unitsConsumed);


                    result = customerService.addCustomer(customer);
                    if (result) {
                       response.sendRedirect("customers");
                    } else {
                        request.setAttribute("error", "Failed to add customer.");
                        request.getRequestDispatcher("customer-form.jsp").forward(request, response);
                    }
                    break;

                case "edit":
                    customerDTO = new CustomerDTO(
                            Integer.parseInt(request.getParameter("id")),
                            Integer.parseInt(request.getParameter("account_number")),
                            request.getParameter("name"),
                            request.getParameter("address"),
                            request.getParameter("telephone"),
                            Integer.parseInt(request.getParameter("units_consumed"))
                    );


                    customer = new Customer(
                            customerDTO.getId(),
                            customerDTO.getAccountNumber(),
                            customerDTO.getName(),
                            customerDTO.getAddress(),
                            customerDTO.getTelephone(),
                            customerDTO.getUnitsConsumed()
                    );
                    result = customerService.updateCustomer(customer);
                    if (result) {
                     response.sendRedirect("customers");
                    } else {
                        request.setAttribute("error", "Failed to update customer.");
                        request.getRequestDispatcher("edit-customer.jsp").forward(request, response);
                    }
                    break;

                case "delete":
                    result = customerService.deleteCustomer(accountNumber);
                    if (result) {
                        request.setAttribute("message", "Customer deleted successfully.");
                    } else {
                        request.setAttribute("error", "Failed to delete customer.");
                    }
                    response.sendRedirect("customers");
                    break;


                default:
                    request.setAttribute("error", "Unknown action.");
                    request.getRequestDispatcher("list-customers.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

}

