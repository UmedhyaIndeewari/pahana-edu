package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.dto.BillDTO;
import com.icbt.model.Bill;

import java.util.ArrayList;
import java.util.List;

public class BillService {
    private final BillDAO billDAO;

    public BillService() {
        this.billDAO = new BillDAO();
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        return billDAO.addBill(bill);
    }

    // Update existing bill
    public boolean updateBill(Bill bill) {
        return billDAO.updateBill(bill);
    }

    // Delete bill by ID
    public boolean deleteBill(int id) {
        return billDAO.deleteBill(id);
    }

    // Get bill by ID
    public BillDTO getBill(int id) {
        Bill bill = billDAO.getBillById(id);
        if (bill != null) {
            return new BillDTO(
                    bill.getId(),
                    bill.getCustomerId(),
                    bill.getTotalAmount(),
                    bill.getBillingDate()
            );
        }
        return null;
    }

    // Get all bills
    public List<BillDTO> getAllBills() {
        List<BillDTO> bills = new ArrayList<>();
        List<Bill> billList = billDAO.getAllBills();
        for (Bill bill : billList) {
            bills.add(new BillDTO(
                    bill.getId(),
                    bill.getCustomerId(),
                    bill.getTotalAmount(),
                    bill.getBillingDate()
            ));
        }
        return bills;
    }
}

