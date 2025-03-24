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
import java.util.Collections;
import java.util.Comparator;

import java.util.List;
import java.util.logging.Logger;

@WebServlet("/tourList")
public class TourListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TourDAO tourDAO = new TourDAO(new DBContext().getConnection());
        List<Tour> allTours = tourDAO.getAllTours(); // Lấy toàn bộ danh sách tour

        String searchQuery = request.getParameter("search");
        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            String lowerSearch = searchQuery.toLowerCase();
            allTours.removeIf(tour -> !tour.getTourName().toLowerCase().contains(lowerSearch));
        }

        // Lấy tham số sort từ request
        String sort = request.getParameter("sort");
        if ("asc".equals(sort)) {
            Collections.sort(allTours, Comparator.comparing(Tour::getPriceAdult));
        } else if ("desc".equals(sort)) {
            Collections.sort(allTours, Comparator.comparing(Tour::getPriceAdult).reversed());
        }
        int pageSize = 9; // Số lượng tour trên mỗi trang
        int totalTours = allTours.size();
        int totalPages = (int) Math.ceil((double) totalTours / pageSize);

        // Lấy số trang từ request (mặc định là 1 nếu không có)
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        // Xác định danh sách tour cần hiển thị trên trang hiện tại
        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, totalTours);
        List<Tour> toursOnPage = allTours.subList(start, end);

        request.setAttribute("tours", toursOnPage);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
