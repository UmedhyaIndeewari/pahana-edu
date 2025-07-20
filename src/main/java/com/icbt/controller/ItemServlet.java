package com.icbt.controller;

import com.icbt.model.Item;
import com.icbt.service.ItemService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/items")
public class ItemServlet extends HttpServlet {

    private ItemService itemService = new ItemService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            // List all items
            List<Item> items = itemService.getAllItems();
            request.setAttribute("items", items);
            RequestDispatcher dispatcher = request.getRequestDispatcher("item-list.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("edit")) {
            // Show edit form with data
            int id = Integer.parseInt(request.getParameter("id"));
            Item item = itemService.getItemById(id);
            request.setAttribute("item", item);
            RequestDispatcher dispatcher = request.getRequestDispatcher("item-form.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            itemService.deleteItem(id);
            response.sendRedirect("items");
        } else if (action.equals("new")) {
            // Display empty form
            RequestDispatcher dispatcher = request.getRequestDispatcher("item-form.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        int id = request.getParameter("id") != null && !request.getParameter("id").isEmpty()
                ? Integer.parseInt(request.getParameter("id"))
                : 0;

        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity"));
        BigDecimal pricePerUnit = BigDecimal.valueOf(Double.parseDouble(request.getParameter("price_per_unit")));

        Item item = new Item(id, name, category, stockQuantity, pricePerUnit);
        boolean result = false;

        switch (action) {
            case "add":
                result = itemService.addItem(item);
                break;
            case "edit":
                result = itemService.updateItem(item);
                break;
        }

        if (result) {
            request.setAttribute("message", "Operation successful.");
        } else {
            request.setAttribute("error", "Operation failed.");
        }

        response.sendRedirect("items");
    }
}
