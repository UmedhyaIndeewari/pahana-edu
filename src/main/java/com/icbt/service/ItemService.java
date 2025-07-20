package com.icbt.service;

import com.icbt.dao.ItemDAO;
import com.icbt.model.Item;

import java.util.List;

public class ItemService {

    private final ItemDAO itemDAO = new ItemDAO();

    // Add a new item
    public boolean addItem(Item item) {
        return itemDAO.addItem(item);
    }

    // Get a single item by ID
    public Item getItemById(int id) {
        return itemDAO.getItemById(id);
    }

    // Update an existing item
    public boolean updateItem(Item item) {
        return itemDAO.updateItem(item);
    }

    // Delete an item by ID
    public boolean deleteItem(int id) {
        return itemDAO.deleteItem(id);
    }

    // Get all items
    public List<Item> getAllItems() {
        return itemDAO.getAllItems();
    }
}

