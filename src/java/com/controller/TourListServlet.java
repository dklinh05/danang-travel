package com.controller;

import DAO.TourDAO;
import com.connect.DBContext;
import com.entity.Tour;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

import java.util.List;
import java.util.logging.Logger;


@WebServlet("/tourList")
public class TourListServlet extends HttpServlet {

    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TourDAO tourDAO = new TourDAO(new DBContext().getConnection());
        List<Tour> tours = tourDAO.getAllTours();
        request.setAttribute("tours", tours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
