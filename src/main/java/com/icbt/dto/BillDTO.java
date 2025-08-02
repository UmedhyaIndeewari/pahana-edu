package com.icbt.dto;

import java.time.LocalDate;
import java.util.List;

public class BillDTO {
    private int id;
    private int customerId;
    private double totalAmount;
    private LocalDate billingDate;
    private List<BillItemDTO> items;

    // Parameterized constructor
    public BillDTO(int id, int customerId, Double totalAmount, LocalDate billingDate) {
        this.id = id;
        this.customerId = customerId;
        this.totalAmount = totalAmount;
        this.billingDate = billingDate;
    }

    public BillDTO(int id, int customerId, double totalAmount, LocalDate billingDate ,  List<BillItemDTO> items) {
        this.id = id;
        this.customerId = customerId;
        this.totalAmount = totalAmount;
        this.billingDate = billingDate;
        this.items = items;
    }

    // Default constructor
    public BillDTO() {}

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<BillItemDTO> getItems() {
        return items;
    }

    public void setItems(List<BillItemDTO> items) {
        this.items = items;
    }

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

