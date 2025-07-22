package com.icbt.service;

import com.icbt.dto.ItemDTO;
import com.icbt.model.Item;
import org.junit.jupiter.api.*;


import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class ItemServiceTest {

    private static ItemService itemService;
    private static int createdItemId;

    @BeforeAll
    public static void setup() {
        itemService = new ItemService();
    }

    @Test
    @Order(1)
    public void testCreateItem() {
        Item item = new Item();
        item.setName("Test Item");
        item.setCategory("Test Category");
        item.setStockQuantity(10);
        item.setPricePerUnit(new Double("15.50"));

        itemService.addItem(item);
        List<ItemDTO> items = itemService.getAllItems();
        for (ItemDTO itemDTO : items) {
            if(itemDTO.getName().equals(item.getName())) {
                createdItemId = itemDTO.getId();
            }
        }
        assertTrue(createdItemId > 0, "Item ID should be generated and > 0");

    }

    @Test
    @Order(2)
    public void testGetItemById() {
        Item fetched = itemService.getItemById(createdItemId);
        assertNotNull(fetched);
        assertEquals("Test Item", fetched.getName());
        assertEquals("Test Category", fetched.getCategory());
    }

    @Test
    @Order(3)
    public void testUpdateItem() {
        Item item = itemService.getItemById(createdItemId);
        item.setName("Updated Item");
        item.setStockQuantity(20);

        itemService.updateItem(item);

        Item updated = itemService.getItemById(createdItemId);
        assertEquals("Updated Item", updated.getName());
        assertEquals(20, updated.getStockQuantity());
    }

    @Test
    @Order(4)
    public void testGetAllItems() {
        List<ItemDTO> items = itemService.getAllItems();
        assertNotNull(items);
        assertFalse(items.isEmpty(), "Item list should not be empty");
    }

    @Test
    @Order(5)
    public void testDeleteItem() {
        itemService.deleteItem(createdItemId);
        Item deleted = itemService.getItemById(createdItemId);
        assertNull(deleted, "Deleted item should be null");
    }
}

