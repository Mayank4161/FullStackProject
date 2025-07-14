package com.companywebappnew.dao;

import com.companywebappnew.dto.NewsletterSubscriber;
import com.companywebappnew.util.DBConnection;
import java.sql.*;

public class NewsletterDAO {
    public boolean addSubscriber(NewsletterSubscriber sub) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO newsletter_subscribers (email) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sub.getEmail());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }
    public boolean existsByEmail(String email) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT COUNT(*) FROM newsletter_subscribers WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        }
    }
} 