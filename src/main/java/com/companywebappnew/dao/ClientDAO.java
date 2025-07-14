package com.companywebappnew.dao;

import com.companywebappnew.dto.Client;
import com.companywebappnew.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {
    public List<Client> getAllClients() throws Exception {
        List<Client> clients = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, name, description, designation, image_path FROM clients ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Client client = new Client(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("designation"),
                    rs.getString("image_path")
                );
                clients.add(client);
            }
        }
        return clients;
    }

    public boolean addClient(Client client) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO clients (name, description, designation, image_path) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, client.getName());
            ps.setString(2, client.getDescription());
            ps.setString(3, client.getDesignation());
            ps.setString(4, client.getImagePath());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean updateClient(Client client) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE clients SET name = ?, description = ?, designation = ?, image_path = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, client.getName());
            ps.setString(2, client.getDescription());
            ps.setString(3, client.getDesignation());
            ps.setString(4, client.getImagePath());
            ps.setInt(5, client.getId());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean deleteClient(int id) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM clients WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }
} 