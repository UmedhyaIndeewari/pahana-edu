package com.icbt.service;

import com.icbt.dao.ItemDAO;
import com.icbt.dto.ItemDTO;
import com.icbt.model.Item;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
    public List<ItemDTO> getAllItems() {
        List<Item> items = itemDAO.getAllItems();
        List<ItemDTO> itemDTOs = new ArrayList<ItemDTO>();
        for (Item item : items) {
            ItemDTO itemDTO = new ItemDTO();
            itemDTO.setId(item.getId());
            itemDTO.setName(item.getName());
            itemDTO.setCategory(item.getCategory());
            itemDTO.setStockQuantity(item.getStockQuantity());
            itemDTO.setPricePerUnit(item.getPricePerUnit());
            itemDTOs.add(itemDTO);
        }
        return itemDTOs;
    }
}

