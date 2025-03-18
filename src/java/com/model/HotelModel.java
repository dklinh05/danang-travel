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
//import com.entity.Hotel;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// *
// * @author thuongnnse05095
// */
//public class HotelModel {
//
//    DBContext db;
//
//    public HotelModel() throws Exception {
//        db = new DBContext();
//    }
//
//    public List<Hotel> getHotelFromTo(int page, int pageSize) throws Exception {
//        int from = page * pageSize - (pageSize - 1);
//        int to = page * pageSize;
//        List<Hotel> hotelList = new ArrayList<>();
//        String query = "select * from ("
//                + "select *, ROW_NUMBER() over (ORDER BY id) AS rownumber FROM Hotels"
//                + ") as hotels "
//                + "where hotels.rownumber >= ? and hotels.rownumber <=?";
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            conn = db.getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, from);
//            ps.setInt(2, to);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String hotelId = rs.getString(1);
//                String hotelName = rs.getString(2);
//                double hotelPrice = rs.getDouble(3);
//                String hotelPhone = rs.getString(4);
//                String hotelAdd = rs.getString(5);
//                double hotelRating = rs.getDouble(6);
////                int id = rs.getInt(1);
////                String title = rs.getString(2);
////                String imgLink = rs.getString(3);
////                String content = rs.getString(4);
////                String fullContent = rs.getString(5);
//                hotelList.add(new Hotel(hotelId, hotelName, hotelPrice, hotelPhone, hotelAdd, hotelRating));
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            db.close(conn, ps, rs);
//        }
//        return hotelList;
//    }
//
//    public Hotel getDetailsPost(int id) throws Exception {
//        String query = "select * from Hotels where id = ?";
//        Hotel hotel = new Hotel();
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        try {
//            conn = db.getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                hotel.setHotelId(rs.getString(1));
//                hotel.setHotelName(rs.getString(2));
//                hotel.setHotelPrice(rs.getDouble(3));
//                hotel.setHotelPhone(rs.getString(4));
//                hotel.setHotelAdd(rs.getString(5));
//                hotel.setHotelRating(rs.getDouble(6));
//            }
//        } catch (Exception ex) {
//            throw ex;
//        } finally {
//            db.close(conn, ps, rs);
//        }
//        return hotel;
//    }
//
//    public int getTotalRows() throws Exception {
//        int rows = 0;
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//
//        String query = "SELECT COUNT(*) FROM Hotels";
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
//
//}
//
