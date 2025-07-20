package com.icbt.service;

import com.icbt.dto.CustomerDTO;
import com.icbt.model.Customer;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class CustomerServiceTest {

    private static CustomerService customerService;

    @BeforeAll
    public static void setup() {
        customerService = new CustomerService();
    }

    @Test
    @Order(1)
    public void testAddCustomer() {
        Customer customer = new Customer(101, 123456, "John Doe", "0771234567", "Colombo", 120);
        boolean result = customerService.addCustomer(customer);
        assertTrue(result, "Customer should be added successfully");
    }

    @Test
    @Order(2)
    public void testGetAllCustomers() {
        List<CustomerDTO> customers = customerService.getAllCustomers();
        assertNotNull(customers, "Customer list should not be null");
        assertTrue(customers.stream().anyMatch(c -> c.getAccountNumber() == 123456),
                "Added customer should exist in the list");
    }

    @Test
    @Order(3)
    public void testUpdateCustomer() {
        Customer updatedCustomer = new Customer(101, 123456, "John Smith", "Galle", "0770000000", 200);
        boolean result = customerService.updateCustomer(updatedCustomer);
        assertTrue(result, "Customer should be updated successfully");

        CustomerDTO retrieved = customerService.getCustomer(123456);
        assertNotNull(retrieved, "Updated customer should be retrievable");
        assertEquals("John Smith", retrieved.getName());
        assertEquals("Galle", retrieved.getAddress());
    }

    @Test
    @Order(4)
    public void testDeleteCustomer() {
        boolean result = customerService.deleteCustomer(123456);
        assertTrue(result, "Customer should be deleted successfully");

        CustomerDTO deleted = customerService.getCustomer(123456);
        assertNull(deleted, "Deleted customer should not exist");
    }
}
