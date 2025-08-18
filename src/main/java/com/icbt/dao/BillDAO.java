package com.icbt.dao;

import com.icbt.model.Bill;
import com.icbt.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {

    // Get bill by ID
    public Bill getBillById(int id) {
        String sql = "SELECT * FROM bills WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Bill(
                            rs.getInt("id"),
                            rs.getInt("customer_id"),
                            rs.getDouble("total_amount"),
                            rs.getDate("billing_date").toLocalDate()
                    );
                }
            }

        } catch (SQLException e) {

        }
        return null;
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        String sql = "INSERT INTO bills (customer_id, total_amount, billing_date) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bill.getCustomerId());
            stmt.setDouble(2, bill.getTotalAmount());
            stmt.setDate(3, Date.valueOf(bill.getBillingDate()));

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {

        }
        return false;
    }

    // Update bill
    public boolean updateBill(Bill bill) {
        String sql = "UPDATE bills SET customer_id = ?, total_amount = ?, billing_date = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, bill.getCustomerId());
            stmt.setDouble(2, bill.getTotalAmount());
            stmt.setDate(3, Date.valueOf(bill.getBillingDate()));
            stmt.setInt(4, bill.getId());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {

        }
        return false;
    }

    // Delete bill
    public boolean deleteBill(int id) {
        String sql = "DELETE FROM bills WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {

        }
        return false;
    }

    // Get all bills
    public List<Bill> getAllBills() {
        String sql = "SELECT * FROM bills";
        List<Bill> bills = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                bills.add(new Bill(
                        rs.getInt("id"),
                        rs.getInt("customer_id"),
                        rs.getDouble("total_amount"),
                        rs.getDate("billing_date").toLocalDate()
                ));
            }

        } catch (SQLException e) {

        }
        return bills;
    }
}

