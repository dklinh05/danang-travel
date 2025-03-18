// File: src/com/entity/Booking.java
package com.entity;

import java.io.Serializable;
import java.util.Date;

public class Booking implements Serializable {
    private int bookingId;
    private int tourId;
    private String name;
    private String phone;
    private String gender;
    private Date dob;
    private String address;
    private int adultCount;
    private int childCount;
    private int infantCount;
    private int totalPrice;
    private Date bookingDate;

    // Hàm dựng không đối số
    public Booking() {
    }

    // Hàm dựng đầy đủ các thuộc tính
    public Booking(int bookingId, int tourId, String name, String phone, String gender, Date dob,
                   String address, int adultCount, int childCount, int infantCount, int totalPrice, Date bookingDate) {
        this.bookingId = bookingId;
        this.tourId = tourId;
        this.name = name;
        this.phone = phone;
        this.gender = gender;
        this.dob = dob;
        this.address = address;
        this.adultCount = adultCount;
        this.childCount = childCount;
        this.infantCount = infantCount;
        this.totalPrice = totalPrice;
        this.bookingDate = bookingDate;
    }
    
    // Hàm dựng phụ chỉ lấy các thuộc tính cần thiết cho admin.jsp
    public Booking(int bookingId, int tourId, String name, int totalPrice, Date bookingDate) {
        this.bookingId = bookingId;
        this.tourId = tourId;
        this.name = name;
        this.totalPrice = totalPrice;
        this.bookingDate = bookingDate;
    }

    // Getters và Setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAdultCount() {
        return adultCount;
    }

    public void setAdultCount(int adultCount) {
        this.adultCount = adultCount;
    }

    public int getChildCount() {
        return childCount;
    }

    public void setChildCount(int childCount) {
        this.childCount = childCount;
    }

    public int getInfantCount() {
        return infantCount;
    }

    public void setInfantCount(int infantCount) {
        this.infantCount = infantCount;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
}
