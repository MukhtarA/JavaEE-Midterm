package com.example.Midterm_JavaEE.servlets;

import com.example.Midterm_JavaEE.Client;
import com.example.Midterm_JavaEE.ClientsDBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/filterClient")
public class FilterClientServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String address = req.getParameter("address");
        String orderstatus = req.getParameter("orderstatus");

        ArrayList<Client> filteredClients = ClientsDBManager.findFilteredClient(name, surname, address, orderstatus, 0, 10);
        req.setAttribute("filteredClients", filteredClients);
        req.getServletContext().getRequestDispatcher("/allClients.jsp").forward(req, resp);

    }
}
