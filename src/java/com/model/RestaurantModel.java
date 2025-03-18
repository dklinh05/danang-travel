///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.model;
//
///**
// *
// * @author Ly Quynh Tran
// */
//import com.connect.DBContext;
//import com.entity.Restaurant;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
///**
// *
// * @author thuongnnse05095
// */
//public class RestaurantModel {
//
//    private final DBContext db;
//    
//    public RestaurantModel() throws Exception {
//        db = new DBContext();
//    }
//
//    public ArrayList<Restaurant> getInfoPage() throws Exception {
//        String query = "select * from Information";
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        ArrayList<Restaurant> restaurantList = new ArrayList<>();
//
//        try {
//            conn = db.getConnection();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String restaurantId = rs.getString(1);
//                String restaurantName = rs.getString(2);
//                double restaurantPrice = rs.getDouble(3);
//                String restaurantPhone = rs.getString(4);
//                String restaurantAdd = rs.getString(5);
//                double restaurantRating = rs.getDouble(6);
//                restaurantList.add(new Restaurant(restaurantId, restaurantName, restaurantPrice, restaurantPhone, restaurantAdd, restaurantRating));
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            db.close(conn, ps, rs);
//        }
//        return restaurantList;
//    }
//
//    public int getTotalRows() throws Exception {
//        int rows = 0;
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        String query = "SELECT COUNT(*) FROM Restaurants";
//
//        try {
//            conn = db.getConnection();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                rows = rs.getInt(1);
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            db.close(conn, ps, rs);
//        }
//        return rows;
//    }
//}
