package com.companywebappnew.dao;

import com.companywebappnew.dto.AdminUser;
import com.companywebappnew.util.DBConnection;
import java.sql.*;

public class AdminUserDAO {
    public AdminUser findByUsernameAndPassword(String username, String password) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM admin_users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password); // In production, use password hashing
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                AdminUser user = new AdminUser(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("email"),
                    rs.getString("full_name")
                );
                return user;
            }
            return null;
        }
    }

    public boolean addAdminUser(AdminUser user) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO admin_users (username, password, email, full_name) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword()); // In production, hash password
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getFullName());
            int rows = pstmt.executeUpdate();
            return rows > 0;
        }
    }

    public boolean deleteAdminUser(int id) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM admin_users WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            int rows = pstmt.executeUpdate();
            return rows > 0;
        }
    }
} 