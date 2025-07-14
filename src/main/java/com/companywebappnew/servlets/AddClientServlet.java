package com.companywebappnew.servlets;

import com.companywebappnew.util.DBConnection;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.UUID;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 5,   // 5MB
    maxRequestSize = 1024 * 1024 * 10 // 10MB
)
@WebServlet("/admin/AddClientServlet")
public class AddClientServlet extends HttpServlet {
    
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif", ".svg"};
    private static final long MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            // Get form parameters
            String name = req.getParameter("name");
            String description = req.getParameter("description");
            Part imagePart = req.getPart("image");
            
            // Validate input
            if (name == null || name.trim().isEmpty()) {
                out.write("Error: Client name is required");
                return;
            }
            if (description == null || description.trim().isEmpty()) {
                out.write("Error: Client description is required");
                return;
            }
            if (imagePart == null || imagePart.getSize() == 0) {
                out.write("Error: Client image is required");
                return;
            }
            
            // Validate file size
            if (imagePart.getSize() > MAX_FILE_SIZE) {
                out.write("Error: Image file size must be less than 5MB");
                return;
            }
            
            // Validate file extension
            String fileName = imagePart.getSubmittedFileName();
            String fileExtension = getFileExtension(fileName);
            boolean validExtension = false;
            for (String ext : ALLOWED_EXTENSIONS) {
                if (ext.equalsIgnoreCase(fileExtension)) {
                    validExtension = true;
                    break;
                }
            }
            if (!validExtension) {
                out.write("Error: Only JPG, JPEG, PNG, GIF, and SVG files are allowed");
                return;
            }
            
            // Generate unique filename
            String uniqueFileName = UUID.randomUUID().toString() + fileExtension;
            
            // Save image to assets/images/
            String uploadPath = getServletContext().getRealPath("") + "assets/images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                if (!uploadDir.mkdirs()) {
                    out.write("Error: Could not create upload directory");
                    return;
                }
            }
            
            String filePath = uploadPath + File.separator + uniqueFileName;
            imagePart.write(filePath);
            
            // Insert into DB
            try (Connection con = DBConnection.getConnection()) {
                String sql = "INSERT INTO clients (name, description, image_path) VALUES (?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, description);
                ps.setString(3, uniqueFileName);
                ps.executeUpdate();
                out.write("Client added successfully!");
            } catch (Exception e) {
                e.printStackTrace();
                out.write("Error: Could not save client to database. Details: " + e.getMessage());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.write("Error: An unexpected error occurred. Details: " + e.getMessage());
        }
    }
    
    private String getFileExtension(String fileName) {
        int lastDotIndex = fileName.lastIndexOf('.');
        return lastDotIndex > 0 ? fileName.substring(lastDotIndex).toLowerCase() : "";
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().write("GET not supported. Please use the form to submit client data via POST.");
    }
} 