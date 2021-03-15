package com.example.Midterm_JavaEE.servlets;

import com.example.Midterm_JavaEE.ClientsDBManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/deleteProduct")
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        int id = Integer.parseInt(req.getParameter("id"));
        if(ClientsDBManager.deleteClient(id)){
            resp.sendRedirect("/editClient.jsp?deleted=true");
        }else{
            resp.sendRedirect("/editClient.jsp?deleted=false");
        }
    }
}
