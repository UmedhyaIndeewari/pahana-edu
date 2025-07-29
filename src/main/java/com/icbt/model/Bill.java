package com.icbt.model;

import java.time.LocalDate;

public class Bill {
    private int id;
    private int customerId;
    private Double totalAmount;
    private LocalDate billingDate;

    // Default constructor
    public Bill() {
    }

    // Parameterized constructor
    public Bill(int id, int customerId, Double totalAmount, LocalDate billingDate) {
        this.id = id;
        this.customerId = customerId;
        this.totalAmount = totalAmount;
        this.billingDate = billingDate;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public LocalDate getBillingDate() {
        return billingDate;
    }

    public void setBillingDate(LocalDate billingDate) {
        this.billingDate = billingDate;
    }
}

