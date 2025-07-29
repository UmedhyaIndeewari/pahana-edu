package com.icbt.service;

import com.icbt.dao.BillDAO;
import com.icbt.dao.BillItemDAO;
import com.icbt.dao.CustomerDAO;
import com.icbt.dto.BillDTO;
import com.icbt.dto.BillItemDTO;
import com.icbt.model.Bill;
import com.icbt.model.BillItem;

import java.util.ArrayList;
import java.util.List;

public class BillService {
    private final BillDAO billDAO;
    private final BillItemDAO billItemDAO;

    public BillService() {
        this.billDAO = new BillDAO();
        this.billItemDAO = new BillItemDAO();
    }

    // Add a new bill
    public boolean addBill(BillDTO bill) {
        Bill billEntity = new Bill(
                bill.getId(),
                bill.getCustomerId(),
                bill.getTotalAmount(),
                bill.getBillingDate()
        );
        return billDAO.addBill(billEntity);
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
            List<BillItem> items = billItemDAO.getAllBillItems();
            List<BillItemDTO> itemDTOs = new ArrayList<>();
            for (BillItem billItem : items) {
                if (billItem.getBillId() == id) {
                    BillItemDTO billItemDTO = new BillItemDTO(
                            billItem.getId(),
                            billItem.getBillId(),
                            billItem.getItemId(),
                            billItem.getQuantity(),
                            billItem.getTotalAmount()
                    );
                    itemDTOs.add(billItemDTO);
                }
            }
            return new BillDTO(
                    bill.getId(),
                    bill.getCustomerId(),
                    bill.getTotalAmount(),
                    bill.getBillingDate(),
                    itemDTOs
            );
        }
        return null;
    }

    // Get all bills
    public List<BillDTO> getAllBills() {
        List<BillDTO> bills = new ArrayList<>();
        List<Bill> billList = billDAO.getAllBills();
        List<BillItem> items = billItemDAO.getAllBillItems();
        for (Bill bill : billList) {
            List<BillItemDTO> itemDTOs = new ArrayList<>();

            for (BillItem billItem : items) {
                if (billItem.getBillId() == bill.getId()) {
                    itemDTOs.add(new BillItemDTO(
                            billItem.getId(),
                            billItem.getBillId(),
                            billItem.getItemId(),
                            billItem.getQuantity(),
                            billItem.getTotalAmount()
                    ));
                }
            }
            bills.add(new BillDTO(
                    bill.getId(),
                    bill.getCustomerId(),
                    bill.getTotalAmount(),
                    bill.getBillingDate(),
                    itemDTOs
            ));
        }
        return bills;
    }
}

