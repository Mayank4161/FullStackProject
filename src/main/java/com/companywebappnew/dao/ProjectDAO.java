package com.companywebappnew.dao;

import com.companywebappnew.dto.Project;
import com.companywebappnew.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {
    public List<Project> getAllProjects() throws Exception {
        List<Project> projects = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, name, description, image_path FROM projects ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Project project = new Project(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getString("image_path")
                );
                projects.add(project);
            }
        }
        return projects;
    }

    public boolean addProject(Project project) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO projects (name, description, image_path) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getImagePath());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean updateProject(Project project) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE projects SET name = ?, description = ?, image_path = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, project.getName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getImagePath());
            ps.setInt(4, project.getId());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public boolean deleteProject(int id) throws Exception {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM projects WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }
} 