package com.icbt.controller;

import com.icbt.dto.BillDTO;
import com.icbt.dto.BillItemDTO;
import com.icbt.dto.CustomerDTO;
import com.icbt.dto.ItemDTO;
import com.icbt.model.Bill;
import com.icbt.model.Customer;
import com.icbt.model.Item;
import com.icbt.service.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/bills")
public class BillServlet extends HttpServlet {
    private BillService billService;
    private ItemService itemService;
    private CustomerService customerService;
    private BillItemService billItemService;

    @Override
    public void init() {
        billService = new BillService();
        customerService = new CustomerService();
        itemService = new ItemService();
        billItemService = new BillItemService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String action = request.getParameter("action");

        if (action != null) {
            if (idParam == null) {
                List<ItemDTO> items = itemService.getAllItems();
                List<CustomerDTO> customers = customerService.getAllCustomers();
                request.setAttribute("items", items);
                request.setAttribute("customers", customers);
                request.getRequestDispatcher("add_bill.jsp").forward(request, response);
            } else {
                if (action.equals("edit")) {
                    int id = Integer.parseInt(idParam);
                    BillDTO bill = billService.getBill(id);
                    List<CustomerDTO> customers = customerService.getAllCustomers();
                    List<ItemDTO> items = itemService.getAllItems();
                    request.setAttribute("customer_id", bill.getCustomerId());
                    request.setAttribute("items", items);
                    request.setAttribute("customers", customers);
                    request.setAttribute("billItems" , bill.getItems());
                    request.setAttribute("billing_date" , bill.getBillingDate());
                    request.setAttribute("id", bill.getId());
                    request.setAttribute("total_amount", bill.getTotalAmount());
                    request.getRequestDispatcher("edit_bill.jsp").forward(request, response);
                } else if (action.equals("delete")) {
                    int id = Integer.parseInt(idParam);
                    billService.deleteBill(id);
                    List<BillItemDTO> billItems = billItemService.getAllBillItems();
                    for (BillItemDTO billItem : billItems) {
                        if (billItem.getBillId() == id) {
                            billItemService.deleteBillItem(billItem.getId());
                        }
                    }
                    response.sendRedirect("bills");
                } else if (action.equals("summary")) {
                    int id = Integer.parseInt(idParam);
                    BillDTO bill = billService.getBill(id);
                    CustomerDTO customer = customerService.getCustomerById(bill.getCustomerId());
                    
                    // Get bill items with item details
                    List<BillItemDTO> billItems = billItemService.getBillItemsByBillId(id);
                    List<ItemDTO> itemsWithDetails = new ArrayList<>();
                    
                    for (BillItemDTO billItem : billItems) {
                        ItemDTO item = itemService.getItem(billItem.getItemId());
                        itemsWithDetails.add(item);
                    }
                    
                    request.setAttribute("bill", bill);
                    request.setAttribute("customer", customer);
                    request.setAttribute("billItems", billItems);
                    request.setAttribute("items", itemsWithDetails);
                    request.getRequestDispatcher("bill_summary.jsp").forward(request, response);
                }
            }
        } else {
            List<BillDTO> billList = billService.getAllBills();
            List<ItemDTO> items = itemService.getAllItems();
            List<CustomerDTO>  customers = customerService.getAllCustomers();
            request.setAttribute("items", items);
            request.setAttribute("bills", billList);
            request.setAttribute("customers", customers);
            request.getRequestDispatcher("list_bill.jsp").forward(request, response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            int id = 0;
            String idString = request.getParameter("id");
            if (idString != null && !idString.isEmpty()) {
                id = Integer.parseInt(idString);
            }

            boolean result = false;
            List<ItemDTO> items = itemService.getAllItems();

            switch (action) {
                case "add":
                    int customerId = Integer.parseInt(request.getParameter("customer_id"));
                    Double totalAmount = Double.parseDouble(request.getParameter("total_amount"));
                    LocalDate date = LocalDate.now();

                    String[] itemIds = request.getParameterValues("itemIds[]");
                    String[] quantities = request.getParameterValues("quantities[]");

                    List<BillItemDTO> billItems = new ArrayList<>();

                    BillDTO newBill = new BillDTO(id, customerId, totalAmount, date);
                    result = billService.addBill(newBill);
                    List<BillDTO> billList = billService.getAllBills();
                    BillDTO addedBill = billList.getLast();
                    for (int i = 0; i < quantities.length; i++) {
                        BillItemDTO billItemDTO = new BillItemDTO();
                        billItemDTO.setItemId(Integer.parseInt(itemIds[i]));
                        billItemDTO.setQuantity(Integer.parseInt(quantities[i]));
                        billItemDTO.setBillId(addedBill.getId());
                        for (ItemDTO item : items) {
                            if( item.getId() == billItemDTO.getItemId()) {
                                billItemDTO.setTotalAmount((billItemDTO.getQuantity() * item.getPricePerUnit()));
                                break;
                            }
                        }
                        billItems.add(billItemDTO);
                    }
                    for (BillItemDTO billItemDTO : billItems) {
                        billItemService.addBillItem(billItemDTO);
                    }
                    if (result) {
                        // Redirect to bill summary page instead of bills list
                        response.sendRedirect("bills?action=summary&id=" + addedBill.getId());
                    } else {
                        request.setAttribute("error", "Failed to add bill.");
                        request.getRequestDispatcher("add_bill.jsp").forward(request, response);
                    }
                    break;

                case "edit":
                    int customerIdEdit = Integer.parseInt(request.getParameter("customer_id"));
                    double totalEdit = Double.parseDouble(request.getParameter("total_amount"));
                    LocalDate dateEdit = LocalDate.parse(request.getParameter("billing_date"));

                    Bill billToUpdate = new Bill(id, customerIdEdit, totalEdit, dateEdit);
                    result = billService.updateBill(billToUpdate);

                    String[] quantitiesEdit = request.getParameterValues("quantities[]");
                    String[] itemIdsEdit = request.getParameterValues("itemIds[]");

                    List<BillItemDTO> itemsToDelete = billItemService.getAllBillItems();
                    for ( BillItemDTO billItemDTO : itemsToDelete) {
                        if( billItemDTO.getBillId() == billToUpdate.getId()) {
                            billItemService.deleteBillItem(billItemDTO.getId());
                        }
                    }

                    for ( int i = 0; i < quantitiesEdit.length; i++) {
                        BillItemDTO billItemDTO = new BillItemDTO();
                        billItemDTO.setItemId(Integer.parseInt(itemIdsEdit[i]));
                        billItemDTO.setQuantity(Integer.parseInt(quantitiesEdit[i]));
                        billItemDTO.setBillId(billToUpdate.getId());
                        for (ItemDTO item : items) {
                            if( item.getId() == billItemDTO.getItemId()) {
                                billItemDTO.setTotalAmount((billItemDTO.getQuantity() * item.getPricePerUnit()));
                                break;
                            }
                        }
                        billItemService.addBillItem(billItemDTO);
                    }
                    if (result) {
                        response.sendRedirect("bills");
                    } else {
                        request.setAttribute("error", "Failed to update bill.");
                        request.getRequestDispatcher("edit_bill.jsp").forward(request, response);
                    }
                    break;

                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    result = billService.deleteBill(deleteId);
                    if (result) {
                        response.sendRedirect("bills");
                    } else {
                        request.setAttribute("error", "Failed to delete bill.");
                        response.sendRedirect("bills");
                    }
                    break;

                default:
                    request.setAttribute("error", "Unknown action.");
                    request.getRequestDispatcher("list_bill.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

