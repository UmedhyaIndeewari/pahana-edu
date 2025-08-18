package com.icbt.service;

import com.icbt.dao.BillItemDAO;
import com.icbt.dto.BillItemDTO;
import com.icbt.model.BillItem;

import java.util.ArrayList;
import java.util.List;

public class BillItemService {
    private final BillItemDAO billItemDAO;

    public BillItemService() {
        this.billItemDAO = new BillItemDAO();
    }

    // Add a new bill item
    public boolean addBillItem(BillItemDTO billItem) {
        BillItem billItemEntity = new BillItem(
                billItem.getId(),
                billItem.getBillId(),
                billItem.getItemId(),
                billItem.getQuantity(),
                billItem.getTotalAmount()
        );
        return billItemDAO.addBillItem(billItemEntity);
    }

    // Update existing bill item
    public boolean updateBillItem(BillItem billItem) {
        return billItemDAO.updateBillItem(billItem);
    }

    // Delete bill item by ID
    public boolean deleteBillItem(int id) {
        return billItemDAO.deleteBillItem(id);
    }

    // Get bill item by ID
    public BillItemDTO getBillItem(int id) {
        BillItem billItem = billItemDAO.getBillItemById(id);
        if (billItem != null) {
            return new BillItemDTO(
                    billItem.getId(),
                    billItem.getBillId(),
                    billItem.getItemId(),
                    billItem.getQuantity(),
                    billItem.getTotalAmount()
            );
        }
        return null;
    }

    // Get all bill items
    public List<BillItemDTO> getAllBillItems() {
        List<BillItemDTO> billItems = new ArrayList<>();
        List<BillItem> billItemList = billItemDAO.getAllBillItems();
        for (BillItem billItem : billItemList) {
            billItems.add(new BillItemDTO(
                    billItem.getId(),
                    billItem.getBillId(),
                    billItem.getItemId(),
                    billItem.getQuantity(),
                    billItem.getTotalAmount()
            ));
        }
        return billItems;
    }

    // Get bill items by bill ID
    public List<BillItemDTO> getBillItemsByBillId(int billId) {
        List<BillItemDTO> billItems = new ArrayList<>();
        List<BillItem> billItemList = billItemDAO.getBillItemsByBillId(billId);
        for (BillItem billItem : billItemList) {
            billItems.add(new BillItemDTO(
                    billItem.getId(),
                    billItem.getBillId(),
                    billItem.getItemId(),
                    billItem.getQuantity(),
                    billItem.getTotalAmount()
            ));
        }
        return billItems;
    }



