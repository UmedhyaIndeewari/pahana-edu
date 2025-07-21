package com.icbt.dao;

import com.icbt.model.Item;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    // Get item by ID
    public Item getItemById(int id) {
        String sql = "SELECT * FROM item WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Item(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("category"),
                            rs.getInt("stock_quantity"),
                            rs.getDouble("price_per_unit")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Error fetching item: " + e.getMessage());
        }
        return null;
    }

    // Add a new item
    public boolean addItem(Item item) {
        String sql = "INSERT INTO item (name, category, stock_quantity, price_per_unit) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, item.getName());
            stmt.setString(2, item.getCategory());
            stmt.setInt(3, item.getStockQuantity());
            stmt.setDouble(4, item.getPricePerUnit());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error adding item: " + e.getMessage());
        }
        return false;
    }

    // Update item
    public boolean updateItem(Item item) {
        String sql = "UPDATE item SET name = ?, category = ?, stock_quantity = ?, price_per_unit = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, item.getName());
            stmt.setString(2, item.getCategory());
            stmt.setInt(3, item.getStockQuantity());
            stmt.setDouble(4, item.getPricePerUnit());
            stmt.setInt(5, item.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error updating item: " + e.getMessage());
        }
        return false;
    }

    // Delete item
    public boolean deleteItem(int id) {
        String sql = "DELETE FROM item WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error deleting item: " + e.getMessage());
        }
        return false;
    }

    // Get all items
    public List<Item> getAllItems() {
        String sql = "SELECT * FROM item";
        List<Item> items = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                items.add(new Item(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getInt("stock_quantity"),
                        rs.getDouble("price_per_unit")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Error fetching items: " + e.getMessage());
        }

        return items;
    }
}

