/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controller;

import com.connect.DBContext;
import com.entity.Tour;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author ASUS
 */
@WebServlet("/bookTour")
public class BookTourServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookTourServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookTourServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
    String tourId = request.getParameter("tourId");
    System.out.println("Received tourId: " + tourId); // Debug

    if (tourId == null || tourId.isEmpty()) {
        response.sendRedirect("index.jsp?error=invalidTour");
        return;
    }

    DBContext dbContext = new DBContext();
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = dbContext.getConnection();
        String sql = "SELECT tour_name, price_adult, price_child, price_infant FROM tours WHERE tour_id = ?";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(tourId));
        rs = ps.executeQuery();

        if (rs.next()) {
            System.out.println("Tour found: " + rs.getString("tour_name")); // Debug

            request.setAttribute("tourId", tourId);
            request.setAttribute("tourName", rs.getString("tour_name"));
            request.setAttribute("priceAdult", rs.getInt("price_adult"));
            request.setAttribute("priceChild", rs.getInt("price_child"));
            request.setAttribute("priceInfant", rs.getInt("price_infant"));

            RequestDispatcher dispatcher = request.getRequestDispatcher("confirmBooking.jsp");
            dispatcher.forward(request, response);
            return;
        } else {
            System.out.println("No tour found for ID: " + tourId);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            dbContext.close(conn, ps, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("index.jsp?error=noTourFound");
}


    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
