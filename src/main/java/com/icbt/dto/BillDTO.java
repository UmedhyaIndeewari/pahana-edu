package com.icbt.dto;

import java.time.LocalDate;

public class BillDTO {
    private int id;
    private int customerId;
    private double totalAmount;
    private LocalDate billingDate;

    // Parameterized constructor
    public BillDTO(int id, int customerId, Double totalAmount, LocalDate billingDate) {
        this.id = id;
        this.customerId = customerId;
        this.totalAmount = totalAmount;
        this.billingDate = billingDate;
    }

    // Default constructor
    public BillDTO() {}

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

