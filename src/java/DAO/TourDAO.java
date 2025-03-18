package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entity.Tour;
import java.util.ArrayList;
import java.util.List;

public class TourDAO {

    private Connection conn;

    public TourDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Tour> getAllTours() {
        List<Tour> tours = new ArrayList<>();
        String sql = "SELECT * FROM tours"; // Kiểm tra lại câu lệnh SQL

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Tour tour = new Tour();
                tour.setTourId(rs.getInt("tour_id"));
                tour.setTourName(rs.getString("tour_name"));
                tour.setDescription(rs.getString("description"));
                tour.setPriceAdult(rs.getInt("price_adult"));
                tour.setPriceChild(rs.getInt("price_child"));
                tour.setPriceInfant(rs.getInt("price_infant"));
                tour.setImageUrl(rs.getString("image_url"));

                tours.add(tour);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tours;
    }

}

//    public Tour getTourById(int tourId) {
//        Tour tour = null;
//        String sql = "SELECT * FROM tours WHERE tour_id = ?";
//
//        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, tourId);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                tour = new Tour();
//                tour.setTourId(rs.getInt("tour_id"));
//                tour.setTourName(rs.getString("tour_name"));
//                tour.setDescription(rs.getString("description"));
//                tour.setPriceAdult(rs.getInt("price_adult"));
//                tour.setPriceChild(rs.getInt("price_child"));
//                tour.setPriceInfant(rs.getInt("price_infant"));
//                tour.setImageUrl(rs.getString("image_url"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return tour;
//    }

