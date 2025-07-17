package com.icbt.controller;

import com.icbt.model.User;
import com.icbt.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    public void init(){userService = new UserService();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.login(username, password);

        if(user != null){
            httpSession session = request.getSession();
            session.setAttribute("user", user);
            RequestDispatcher rd = request.getRequestDispatcher("main-menu.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("error", "Invalid username or password.");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }

        }

    }






}
