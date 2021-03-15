package com.example.Midterm_JavaEE.servlets;

import com.example.Midterm_JavaEE.Client;
import com.example.Midterm_JavaEE.ClientsDBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;

@WebServlet("/updateClient")
public class UpdateClientServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);

        int id = Integer.parseInt(req.getParameter("id"));
        req.getRequestDispatcher("/editClient.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);

        Client client = ClientsDBManager.getClientById(Integer.parseInt(req.getParameter("id1")));
        int[] date = Arrays.stream(req.getParameter("birthday1").split("-")).mapToInt(Integer::parseInt).toArray();

        client.setName(req.getParameter("name1").trim());
        client.setSurname(req.getParameter("surname1").trim());
        client.setBirthday(LocalDate.of(date[0], date[1], date[2]));
        client.setAddress(req.getParameter("address1"));
        client.setOrderstatus(req.getParameter("orderStatus1"));

        if(ClientsDBManager.saveClient(client)){
            resp.sendRedirect("/editClient.jsp?success=true");
        }else{
            resp.sendRedirect("/editClient.jsp?success=true");
        }
    }
}
