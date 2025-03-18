/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.controller;

/**
 *
 * @author ADMIN
 */

import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Random;

public class Config {

    // Cấu hình thông tin merchant
    public static String vnp_TmnCode = " 0CEMUAZ4"; // Thay bằng mã TMN của bạn
    public static String vnp_HashSecret = "FBLP79XQM63M4U2XFL77PFC024ZJHD83"; // Thay bằng hash secret
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html"; // URL thanh toán VNPAY
    public static String vnp_Returnurl = "http://localhost:8080/DaNangProject_1_1_1_1/VNPayReturnServlet";
    public static String vnp_OrderInfo = "Premium";
    public static String ordertype = "170000";
    public static int amount = 100000 * 100;
    public static String bankcode = "";
    

    // Hàm tạo số giao dịch ngẫu nhiên (8 chữ số)
    public static String getRandomNumber(int len) {
        String digits = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        Random random = new Random();
        for (int i = 0; i < len; i++) {
            sb.append(digits.charAt(random.nextInt(digits.length())));
        }
        return sb.toString();
    }

    // Hàm lấy địa chỉ IP của client
    public static String getIpAddress(jakarta.servlet.http.HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty()) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

    // Hàm tạo SecureHash bằng thuật toán HMAC-SHA512
    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmac = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac.init(secretKey);
            byte[] hashBytes = hmac.doFinal(data.getBytes(StandardCharsets.UTF_8));

            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException | java.security.InvalidKeyException e) {
            throw new RuntimeException("Error while generating HMAC-SHA512", e);
        }
    }
}