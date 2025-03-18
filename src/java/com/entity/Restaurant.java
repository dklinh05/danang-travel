/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

import java.io.Serializable;

/**
 *
 * @author hungt
 */
public class Restaurant implements Serializable {
    String restaurantId;
    String restaurantName;
    double restaurantPrice;
    String restaurantPhone;
    String restaurantAdd;
    double restaurantRating;

    public Restaurant() {
    }

    public Restaurant(String restaurantId, String restaurantName, double restaurantPrice, String restaurantPhone, String restaurantAdd, double restaurantRating) {
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.restaurantPrice = restaurantPrice;
        this.restaurantPhone = restaurantPhone;
        this.restaurantAdd = restaurantAdd;
        this.restaurantRating = restaurantRating;
    }

    public String getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(String restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public double getRestaurantPrice() {
        return restaurantPrice;
    }

    public void setRestaurantPrice(double restaurantPrice) {
        this.restaurantPrice = restaurantPrice;
    }

    public String getRestaurantPhone() {
        return restaurantPhone;
    }

    public void setRestaurantPhone(String restaurantPhone) {
        this.restaurantPhone = restaurantPhone;
    }

    public String getRestaurantAdd() {
        return restaurantAdd;
    }

    public void setRestaurantAdd(String restaurantAdd) {
        this.restaurantAdd = restaurantAdd;
    }

    public double getRestaurantRating() {
        return restaurantRating;
    }

    public void setRestaurantRating(double restaurantRating) {
        this.restaurantRating = restaurantRating;
    }
    
    
}
