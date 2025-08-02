package com.icbt.dao;

import com.icbt.model.BillItem;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillItemDAO {

    // Get bill item by ID
    public BillItem getBillItemById(int id) {
        String sql = "SELECT * FROM bill_items WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new BillItem(
                            rs.getInt("id"),
                            rs.getInt("bill_id"),
                            rs.getInt("item_id"),
                            rs.getInt("quantity"),
                            rs.getDouble("total_amount")
                    );
                }
            }

        } catch (SQLException e) {
            System.out.println("Error fetching bill item: " + e.getMessage());
        }
        return null;
    }

    // Add a new bill item
    public boolean addBillItem(BillItem item) {
        String sql = "INSERT INTO bill_items (bill_id, item_id, quantity, total_amount) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, item.getBillId());
            stmt.setInt(2, item.getItemId());
            stmt.setInt(3, item.getQuantity());
            stmt.setDouble(4, item.getTotalAmount());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error adding bill item: " + e.getMessage());
        }
        return false;
    }

    // Update bill item
    public boolean updateBillItem(BillItem item) {
        String sql = "UPDATE bill_items SET bill_id = ?, item_id = ?, quantity = ?, total_amount = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, item.getBillId());
            stmt.setInt(2, item.getItemId());
            stmt.setInt(3, item.getQuantity());
            stmt.setDouble(4, item.getTotalAmount());
            stmt.setInt(5, item.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error updating bill item: " + e.getMessage());
        }
        return false;
    }

    // Delete bill item
    public boolean deleteBillItem(int id) {
        String sql = "DELETE FROM bill_items WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("Error deleting bill item: " + e.getMessage());
        }
        return false;
    }

    // Get all bill items
    public List<BillItem> getAllBillItems() {
        String sql = "SELECT * FROM bill_items";
        List<BillItem> items = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                items.add(new BillItem(
                        rs.getInt("id"),
                        rs.getInt("bill_id"),
                        rs.getInt("item_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("total_amount")
                ));
            }

        } catch (SQLException e) {
            System.out.println("Error fetching bill items: " + e.getMessage());
        }
        return items;
    }
}

