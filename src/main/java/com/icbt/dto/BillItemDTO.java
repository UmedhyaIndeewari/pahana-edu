package com.icbt.dto;



public class BillItemDTO {
    private int id;
    private int billId;
    private int itemId;
    private int quantity;
    private Double totalAmount;

    // Parameterized constructor
    public BillItemDTO(int id, int billId, int itemId, int quantity, Double totalAmount) {
        this.id = id;
        this.billId = billId;
        this.itemId = itemId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
    }

    // Default constructor
    public BillItemDTO() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }
}

