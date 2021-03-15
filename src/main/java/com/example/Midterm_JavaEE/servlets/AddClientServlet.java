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

@WebServlet("/addClient")
public class AddClientServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
        int[] date = Arrays.stream(req.getParameter("birthday1").split("-")).mapToInt(Integer::parseInt).toArray();

        Client client = new Client(
                req.getParameter("name1").trim(),
                req.getParameter("surname1").trim(),
                LocalDate.of(date[0], date[1], date[2]),
                req.getParameter("address1").trim(),
                req.getParameter("orderStatus1").trim()
        );

        if(ClientsDBManager.addClient(client)){
            resp.sendRedirect("/addClient.jsp?success=true");
        }else{
            resp.sendRedirect("/addClient.jsp?success=false");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
