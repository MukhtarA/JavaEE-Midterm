package com.example.Midterm_JavaEE.servlets;

import com.example.Midterm_JavaEE.Client;
import com.example.Midterm_JavaEE.ClientsDBManager;
import com.example.Midterm_JavaEE.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;

    @WebServlet("/addProduct")
    public class AddProductServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            super.doPost(req, resp);

            Product product = new Product(
                    req.getParameter("flowerType").trim(),
                    req.getParameter("color").trim(),
                    req.getParameter("price").trim(),
                    req.getParameter("season").trim()
            );
        }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            super.doGet(req, resp);
        }
    }
