package com.companywebappnew.dao;

import com.companywebappnew.dto.Contact;
import com.companywebappnew.util.DBConnection;
import java.sql.*;

public class ContactDAO {
    public boolean addContact(Contact contact) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO contacts (name, email, phone, city, message) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getPhone());
            ps.setString(4, contact.getCity());
            ps.setString(5, contact.getMessage());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }
} 