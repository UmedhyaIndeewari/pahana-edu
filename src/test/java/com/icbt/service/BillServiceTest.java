package com.icbt.service;

import com.icbt.dto.BillDTO;
import com.icbt.dto.BillItemDTO;
import com.icbt.model.Item;
import com.icbt.util.DBConnection;
import org.junit.jupiter.api.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;


import static org.junit.jupiter.api.Assertions.*;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class BillServiceTest {

    private static BillService billService;
    private static int testCustomerId = 1; // Must exist in DB
    private static int testItemId = 1;     // Must exist in DB
    private static int insertedBillId = -1;

    @BeforeAll
    public static void setup() {
        billService = new BillService();
    }

    @Test
    @Order(1)
    public void testAddBillWithItems() {
        BillDTO billDTO = new BillDTO();
        billDTO.setCustomerId(testCustomerId);
        billDTO.setBillingDate(LocalDate.now());

        BillItemDTO item1 = new BillItemDTO();
        item1.setItemId(testItemId);
        item1.setQuantity(2);
        item1.setTotalAmount(new Double("500.00"));

        List<BillItemDTO> items = List.of(item1);
        billDTO.setTotalAmount(new Double("500.00"));
        billDTO.setItems(items);


        boolean added = billService.addBill(billDTO);
        if(added) {
            List<BillDTO>billDTOs = billService.getAllBills();
            insertedBillId = billDTOs.getLast().getId();
        }


        assertTrue(insertedBillId > 0, "Bill should be inserted and return valid ID.");
    }

    @Test
    @Order(2)
    public void testGetBillById() {
        BillDTO bill = billService.getBill(insertedBillId);
        assertNotNull(bill, "Bill should be found.");
        assertEquals(testCustomerId, bill.getCustomerId());
    }

    @Test
    @Order(3)
    public void testGetAllBills() {
        List<BillDTO> bills = billService.getAllBills();
        assertFalse(bills.isEmpty(), "There should be at least one bill.");
    }

    @AfterAll
    public static void cleanUp() {
        if (insertedBillId > 0) {
            try (Connection conn = DBConnection.getConnection()) {
                try (PreparedStatement stmt1 = conn.prepareStatement("DELETE FROM bill_items WHERE bill_id = ?")) {
                    stmt1.setInt(1, insertedBillId);
                    stmt1.executeUpdate();
                }
                try (PreparedStatement stmt2 = conn.prepareStatement("DELETE FROM bills WHERE id = ?")) {
                    stmt2.setInt(1, insertedBillId);
                    stmt2.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                fail("Cleanup failed.");
            }
        }
    }
}

