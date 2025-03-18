/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

import java.io.Serializable;
import java.util.Date;
/**
 *
 * @author hungt
 */
public class User implements Serializable {
    String userId;
    String userName;
    String userPhone;
    String userGender;
    Date userDob;
    String userAdd;

    public User() {
    }

    public User(String userId, String userName, String userPhone, String userGender, Date userDob, String userAdd) {
        this.userId = userId;
        this.userName = userName;
        this.userPhone = userPhone;
        this.userGender = userGender;
        this.userDob = userDob;
        this.userAdd = userAdd;
    }
    
    

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public Date getUserDob() {
        return userDob;
    }

    public void setUserDob(Date userDob) {
        this.userDob = userDob;
    }

    public String getUserAdd() {
        return userAdd;
    }

    public void setUserAdd(String userAdd) {
        this.userAdd = userAdd;
    }
    
    
}
