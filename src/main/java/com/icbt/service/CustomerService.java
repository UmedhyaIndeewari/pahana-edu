package com.icbt.service;

import com.icbt.dao.CustomerDAO;
import com.icbt.dto.CustomerDTO;
import com.icbt.model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    private final CustomerDAO customerDAO;

    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    // Add a new customer
    public boolean addCustomer(Customer customer) {
        return customerDAO.addCustomer(customer);
    }

    // Update existing customer
    public boolean updateCustomer(Customer customer) {
        return customerDAO.updateCustomer(customer);
    }

    // Delete customer by account number
    public boolean deleteCustomer(int accountNumber) {
        return customerDAO.deleteCustomer(accountNumber);
    }

    // Get customer by account number
    public CustomerDTO getCustomer(int accountNumber) {
        Customer customer = customerDAO.getCustomerByAccountNumber(accountNumber);
        if (customer != null) {
            return new CustomerDTO(
                    customer.getId(),
                    customer.getAccountNumber(),
                    customer.getName(),
                    customer.getAddress(),
                    customer.getTelephone(),
                    customer.getUnitsConsumed()
            );
        }
        return null;
    }

    // Get customer by ID
    public CustomerDTO getCustomerById(int id) {
        Customer customer = customerDAO.getCustomerById(id);
        if (customer != null) {
            return new CustomerDTO(
                    customer.getId(),
                    customer.getAccountNumber(),
                    customer.getName(),
                    customer.getAddress(),
                    customer.getTelephone(),
                    customer.getUnitsConsumed()
            );
        }
        return null;
    }

//     Get all customers
    public List<CustomerDTO> getAllCustomers() {
        List<CustomerDTO> customers = new ArrayList<>();
        List<Customer> customerList =  customerDAO.getAllCustomers();
        for (Customer customer : customerList) {
            customers.add(new CustomerDTO(
                    customer.getId(),
                    customer.getAccountNumber(),
                    customer.getName(),
                    customer.getAddress(),
                    customer.getTelephone(),
                    customer.getUnitsConsumed()
            ));
        }
        return customers;
    }
}
